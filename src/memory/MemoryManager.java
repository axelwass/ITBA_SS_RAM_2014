package memory;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class MemoryManager {
	
	private List<Bin> bins = new ArrayList<Bin>();
	private HashMap<Long, MemoryBlock> blocksStarts = new HashMap<Long, MemoryBlock>();
	private HashMap<Long, MemoryBlock> blocksEnds = new HashMap<Long, MemoryBlock>();
	
	private Set<MemoryBlock> used = new TreeSet<>(new Comparator<MemoryBlock>() {

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
		
		int n = getBlockNumbre(MemorySize, info)+1;
		for(int i=0;i<n;i++){
			switch (order) {
			case BEST:
				bins.add(Bin.BestFit());
				break;
			case WORST:
				bins.add(Bin.WorstFit());
				break;
			case RANDOM:
				bins.add(Bin.Random());
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
	
	public MemoryBlock simulateMalloc(int size, OperationInfo info){
		
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
		
		if(block.getSize()>1024*1024){
			System.out.println(block.getSize());
		}
		
		used.add(block);
		return block;
	}

	
	public void simulateFree(MemoryBlock block, OperationInfo info){
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
	
	public HistogramInformation histogram(int range, long mamorySize){
		HistogramInformation histo = new HistogramInformation(range, mamorySize);
		for(Bin bin: bins){
			for(MemoryBlock block: bin.blocks){
				histo.addUnused(block);
			}
		}
		
		for(MemoryBlock block: used){
			histo.addUsed(block);
		}
		
		return histo;
	}
}
