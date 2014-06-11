package keeperShip.model.ss.main;

import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;
import java.util.concurrent.atomic.AtomicBoolean;

import keeperShip.model.ss.memory.HistogramInformation;
import keeperShip.model.ss.memory.MemoryBlock;
import keeperShip.model.ss.memory.MemoryManager;
import keeperShip.model.ss.memory.OperationInfo;
import keeperShip.model.ss.memory.OrderConfiguration;
import keeperShip.model.ss.randoms.RandomGenerator;
import keeperShip.web.command.ImageConteiner;

public class Simulation implements Runnable {

	
	Thread thread;
	AtomicBoolean running = new AtomicBoolean(false);
	AtomicBoolean finished = new AtomicBoolean(false);
	
	Iterator<Double> iterator;
	
	LongLongStistic mallocSteps = new LongLongStistic(0);
	LongLongStistic freeSteps = new LongLongStistic(0);
	
	long mallocCant = 0;
	long freeCant = 0;
	
	
	long overflows = 0;
	double frag = 0;
	double frag2 = 0;
	long time= 0;
	
	double secondMinFreeBlockSize[];
	
	RandomGenerator randoms;
	MemoryManager manager;
	
	PriorityQueue<FreeEvent> frees = new PriorityQueue<FreeEvent>(11, new Comparator<FreeEvent>() {

		@Override
		public int compare(FreeEvent o1, FreeEvent o2) {
			return o1.time - o2.time<0?-1:1;
		}
		
	});
	
	long simulationTime;
	long memorySize;
	OrderConfiguration order;
	int range;
	String context;
	
	ImageConteiner image;
	
	
	public Simulation(long simulationTime, long memorySize,
			OrderConfiguration order, int range, String context, ImageConteiner image) {
		super();
		this.simulationTime = simulationTime;
		this.memorySize = memorySize;
		this.order = order;
		this.range = range;
		this.context = context;
		this.image = image;
		this.secondMinFreeBlockSize = new double[(int) (simulationTime/1000 + 1)];
	}
	
	public void doMalloc(){
		OperationInfo info = new OperationInfo();
		MemoryBlock block = manager.simulateMalloc( randoms.Esize(), info);
		mallocSteps.increment(info.steps);
		mallocCant++;
		overflows += info.overflow?1:0;
		if(block != null){
			long lifeTime = randoms.Efree();
			if(lifeTime > 1048576 || lifeTime>Long.MAX_VALUE-time){
//				System.out.println("algo va mal!");
			}
			frees.add(new FreeEvent(lifeTime>Long.MAX_VALUE-time?Integer.MAX_VALUE:time+lifeTime, block));
		}
		
	}
	
	public void doFree(){
		OperationInfo info = new OperationInfo();
		manager.simulateFree(frees.poll().block, info);
		
		freeSteps.increment(info.steps);
		freeCant++;
	}
	
	@Override
	public void run() {
		System.out.println("start!");
		OperationInfo createOperationInfo = new OperationInfo();
		manager = new MemoryManager(range, order, memorySize, 16,createOperationInfo);
		randoms = new RandomGenerator(context);

		while(running.get() && time<simulationTime){
			
			if((time % (1000))==0){
				//System.out.println("seconds= " + (time / (1000)));
				if( image!=null && !image.isUpdated()){
					HistogramInformation histogram = manager.histogram(16, memorySize);
					image.updateImage(histogram);
				}
				
				Thread.yield();
			}
			

			time++;
			
			long mallocs = randoms.Emalloc();
			
			long mallocsDone = 0;
			
			while(mallocsDone<mallocs){
				if(!frees.isEmpty() && frees.peek().time <= time){
					if(randoms.Eorder()){
						mallocsDone++;
						doMalloc();
					}
					else{
						doFree();
					}
				}
				else{
					mallocsDone++;
					doMalloc();
				}
				
			}
			
			while(!frees.isEmpty() && frees.peek().time <= time){
				doFree();
			}
			
			//System.out.println("mallocs: " + mallocsC +" - frees: " + freesC + "future frees: " + frees.size());
			
			secondMinFreeBlockSize[(int) (time/1000)] = Math.max(manager.getMinFreeBlockSize(), secondMinFreeBlockSize[(int) (time/1000)]);
			

			double fragAcrtual =  manager.getFragmentation();
			if(frag +fragAcrtual<0){
				frag2 += fragAcrtual;
			}else{
				frag += fragAcrtual;
			}
		}
		
		//System.out.println("malloc steps promedio= " + mallocSteps.getMean(mallocCant));
		//System.out.println("free steps promedio= " + freeSteps.getMean(freeCant) );
		//System.out.println("overflows= " + overflows);
		//System.out.println("frag promedio= " + (frag / time + frag2/time));
		//System.out.println("frag maxima= " + maxFragmentation);
		randoms = null;
		manager = null;
		frees = null; 
		image = null;
		
		
		finished.set(true);
		running.set(false);
		
	}
	
	public void start(){
		running.set(true);
		thread = new Thread(this);
		thread.start();
	}

	public void stop(){
		running.set(false);
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public boolean finished(){
		return finished.get();
	}

	public boolean waitFinish(long time) {
		try {
			if(thread.isAlive()){
				thread.join(time);
				return !thread.isAlive();
			}else{
				return true;
			}
		} catch (InterruptedException e) {
			return false;
		}
	}
	
	private class LongLongStistic{
		long number1;
		long number2;
		
		public LongLongStistic(long init) {
			number1 = init;
			number2 = 0;
		}
		
		public void increment(long number) {
			if(Long.MAX_VALUE-number1>number){
				number2 +=number;
			}
			else{
				number1 += number;
			}
		}
		
		private double getMean(long divisor) {
			return number1 / (double)divisor + number2/(double)divisor;
		}
	}

	public Iterator<Double> getIterator(){
		if(iterator == null){
			this.iterator = createIterator();
		}
		return iterator;
	}
	
	
	private Iterator<Double> createIterator() {
		return new Iterator<Double>() {

			int i = 0;
			
			@Override
			public boolean hasNext() {
				return i<secondMinFreeBlockSize.length + 2;
			}

			@Override
			public Double next() {
				if(i==0){
					i++;
					return (mallocSteps.getMean(mallocCant) + freeSteps.getMean(freeCant))/2;
				}
				else if(i==1){
					i++;
					return (frag / time + frag2/time);
				}
				else{
					return secondMinFreeBlockSize[i++-2];
				}
			}
		};
	}
	
}
