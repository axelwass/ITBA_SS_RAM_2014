package keeperShip.model.ss.memory;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class MemoryManager {
	
	private List<Bin> bins = new ArrayList<Bin>();
	private HashMap<Long, MemoryBlock> blocksStarts = new HashMap<Long, MemoryBlock>();
	private HashMap<Long, MemoryBlock> blocksEnds = new HashMap<Long, MemoryBlock>();
	
	long freeMemory;
	long memorySize;
	
	private Set<MemoryBlock> used = new TreeSet<MemoryBlock>(new Comparator<MemoryBlock>() {

		@Override
		public int compare(MemoryBlock b1, MemoryBlock b2) {
			int difference = (int)(b2.getSize() - b1.getSize());
			return difference==0?(int)(b2.start - b1.start):difference;
		}

	});
	
	private int MinSize;
	private int range;
	
	public MemoryManager(int range, OrderConfiguration order, long MemorySize, int MinSize, OperationInfo info) {
		this.MinSize = MinSize;
		this.range = range;
		
		this.memorySize = MemorySize;
		this.freeMemory = MemorySize;
		
		int n = getBlockNumbre(MemorySize, info)+1;
		for(int i=0;i<n;i++){
			switch (order) {
			case BEST:
				bins.add(new BestFitBin());
				break;
			case WORST:
				bins.add(new WorstFitBin());
				break;
			case RANDOM:
				bins.add(new RandomBin());
				break;
			default:
				System.out.println("Unimplemented order");
			}
			
		}
		addBlock(new MemoryBlock(0, MemorySize-1), info);
	}
	
	private int getBlockNumbre(long size, OperationInfo info){
		
		int n = 0;
		for(long i = 1;i<size ;i*=range){
			n++;
			info.steps++;
		}
		//int n = (int)(Math.log(size)/Math.log(range));
		
		return n;
	}
	
	private void addBlock(MemoryBlock block,OperationInfo info) {
		blocksStarts.put(block.start, block);
		blocksEnds.put(block.end, block);
		bins.get(getBlockNumbre(block.getSize(), info)).addBlock(block, info);
	}
	
	public MemoryBlock simulateMalloc(long size, OperationInfo info){
		
		int n = getBlockNumbre(size, info);
		
		MemoryBlock block = null;
		while(block == null && n<bins.size()){
			info.steps++;
			block = bins.get(n++).getAndRemoveBlock(size, info);
		}
		
		
		if(block == null){
			info.overflow = true;
			return null;
		}
		blocksStarts.remove(block.start);
		blocksEnds.remove(block.end);
		
		MemoryBlock rest = block.splitt(size,MinSize);
		
		if(rest != null){
			addBlock(rest, info);
		}
		
		freeMemory -= block.getSize();
		used.add(block);
		return block;
	}

	
	public void simulateFree(MemoryBlock block, OperationInfo info){
		freeMemory += block.getSize();
		used.remove(block);
		
		MemoryBlock next = blocksStarts.get(block.end + 1);
		MemoryBlock previous = blocksEnds.get(block.start - 1);
		
		if(next != null){
			blocksStarts.remove(next.start);
			blocksEnds.remove(next.end);
			bins.get(getBlockNumbre(next.getSize(), new OperationInfo())).removeBlock(next);
			block.coaliseNext(next);
		}
		
		if(previous != null){
			blocksStarts.remove(previous.start);
			blocksEnds.remove(previous.end);
			bins.get(getBlockNumbre(previous.getSize(), new OperationInfo())).removeBlock(previous);
			block.coalisePrevious(previous);
		}
		
		addBlock(block, info);
	}
	
	public double getFragmentation(){
		for(int i = bins.size() - 1;i>=0;i--){
			long maxSize = bins.get(i).getMaxSize();
			if( maxSize != 0){
				return 1- ((double)maxSize/(double)freeMemory); 
			}
		}
		return 0;
	}
	
	public HistogramInformation histogram(int range, long mamorySize){
		HistogramInformation histo = new HistogramInformation(range, mamorySize);
		for(Bin bin: bins){
			for(MemoryBlock block: bin){
				histo.addUnused(block);
			}
		}
		
		for(MemoryBlock block: used){
			histo.addUsed(block);
		}
		
		return histo;
	}

	public double getMinFreeBlockSize() {
		for(int i = bins.size() - 1;i>=0;i--){
			long maxSize = bins.get(i).getMaxSize();
			if( maxSize != 0){
				return (double)maxSize/(double)memorySize; 
			}
		}
		return 0;
	}
}
