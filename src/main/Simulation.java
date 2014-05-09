package main;

import gui.Window;

import java.util.Comparator;
import java.util.PriorityQueue;

import memory.HistogramInformation;
import memory.MemoryBlock;
import memory.MemoryManager;
import memory.OperationInfo;
import memory.OrderConfiguration;
import randoms.RandomGenerator;

public class Simulation {
	
	static long SimulationTime = 1000 * 60 * 10;
	static long MemorySize = 1024 * 1024 * 1024;
	
	
	long mallocSteps = 0;
	long freeSteps = 0;
	
	long mallocCant = 0;
	long freeCant = 0;
	
	
	long overflows = 0;
	double frag = 0;
	long time= 0;
	
	RandomGenerator randoms;
	MemoryManager manager;
	
	PriorityQueue<FreeEvent> frees = new PriorityQueue<FreeEvent>(11, new Comparator<FreeEvent>() {

		@Override
		public int compare(FreeEvent o1, FreeEvent o2) {
			return (int)(o1.time - o2.time);
		}
		
	});
	
	Window window = new Window(MemorySize);
	
	public Simulation() {
		System.out.println("start!");
		OperationInfo createOperationInfo = new OperationInfo();
		manager = new MemoryManager(4, OrderConfiguration.RANDOM
				, MemorySize, 16,createOperationInfo);
		randoms = new RandomGenerator("./context/samples/vim.json");
		
		while(time<SimulationTime){
			
			if((time % (1000))==0){
				System.out.println("seconds= " + (time / (1000)));
				HistogramInformation histogram = manager.histogram(16, MemorySize);
				System.out.println(histogram);
				window.setHistogram(histogram);
				window.repaint();
			}
			

			time++;
			
			int mallocs = randoms.Emalloc();
			if(mallocs>256){
				System.out.println("EPA! " + mallocs );
			}
			for(int i =0; i<mallocs;i++){
				OperationInfo info = new OperationInfo();
				MemoryBlock block = manager.simulateMalloc(randoms.Esize(), info);
				mallocSteps += info.steps;
				mallocCant++;
				overflows += info.overflow?1:0;
				if(block != null){
					long freeTime = time +randoms.Efree();
					frees.add(new FreeEvent(freeTime<0?Integer.MAX_VALUE:freeTime, block));
				}
			}
			
			while(!frees.isEmpty() && frees.peek().time == time){
				OperationInfo info = new OperationInfo();
				manager.simulateFree(frees.poll().block, info);
				freeSteps += info.steps;
				freeCant++;
			}
		}
		
		/*while(!frees.isEmpty() ){
			OperationInfo info = new OperationInfo();
			manager.simulateFree(frees.poll().block, info);
			freeSteps += info.steps;
			freeCant++;
		}*/
		
		System.out.println("malloc steps promedio= " + (mallocSteps / mallocCant));
		System.out.println("free steps promedio= " + (freeSteps / freeCant));
		System.out.println("overflows= " + overflows);
		System.out.println("frag promedio= " + (frag / time));
		
	}
	
	public static void main(String[] args) {
		new Simulation();
	}
}
