package main;

import java.util.Comparator;
import java.util.PriorityQueue;

import memory.MemoryBlock;
import memory.MemoryManager;
import memory.OperationInfo;
import memory.OrderConfiguration;
import randoms.RandomGenerator;

public class Simulation {
	
	static long SimulationTime = 1000 * 60 * 60 * 24;
	
	long mallocSteps = 0;
	long freeSteps = 0;
	
	int mallocCant = 0;
	int freeCant = 0;
	
	
	int overflows = 0;
	double frag = 0;
	int time= 0;
	
	RandomGenerator randoms;
	MemoryManager manager;
	
	PriorityQueue<FreeEvent> frees = new PriorityQueue<FreeEvent>(11, new Comparator<FreeEvent>() {

		@Override
		public int compare(FreeEvent o1, FreeEvent o2) {
			return o1.time - o2.time;
		}
		
	});
	
	public Simulation() {
		System.out.println("start!");
		OperationInfo createOperationInfo = new OperationInfo();
		manager = new MemoryManager(32, OrderConfiguration.RANDOM,
				1024 * 1024 * 1024, 16,createOperationInfo);
		randoms = new RandomGenerator();
		
		while(time<SimulationTime){
			time++;
			
			for(int i =0; i<randoms.Emalloc();i++){
				OperationInfo info = new OperationInfo();
				MemoryBlock block = manager.simulateMalloc(randoms.Esize(), info);
				mallocSteps += info.steps;
				mallocCant++;
				overflows += info.overflow?1:0;
				if(block != null){
					frees.add(new FreeEvent(time +randoms.Efree(), block));
				}
			}
			
			while(!frees.isEmpty() && frees.peek().time == time){
				OperationInfo info = new OperationInfo();
				manager.simulateFree(frees.poll().block, info);
				freeSteps += info.steps;
				freeCant++;
			}
			
			if(time % 1000){
				
			}
		}
		
		while(!frees.isEmpty() ){
			OperationInfo info = new OperationInfo();
			manager.simulateFree(frees.poll().block, info);
			freeSteps += info.steps;
		}
		
		System.out.println();
		
	}
	
	public static void main(String[] args) {
		new Simulation();
	}
}
