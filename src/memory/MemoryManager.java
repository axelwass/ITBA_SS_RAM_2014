package memory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MemoryManager {
	
	private List<Bin> bins = new ArrayList<Bin>();
	private HashMap<Integer, MemoryBlock> blocksStarts = new HashMap<>();
	private HashMap<Integer, MemoryBlock> blocksEnds = new HashMap<>();
	
	private int MinSize;
	private int range;
	
	public MemoryManager(int range, OrderConfiguration order, int MemorySize, int MinSize, OperationInfo info) {
		this.MinSize = MinSize;
		this.range = range;
		
		int n = getBlockNumbre(MemorySize, info)+1;
		for(int i=0;i<n;i++){
			switch (order) {
			case FIFO:
				bins.add(Bin.Fifo());
				break;
			case LIFO:
				bins.add(Bin.Lifo());
				break;
			case RANDOM:
				bins.add(Bin.Random());
				break;
			default:
				System.out.println("Unimplemented order");
			}
			
		}
		addBlock(new MemoryBlock(0, MemorySize), info);
	}
	
	private int getBlockNumbre(int size, OperationInfo info){
		
		int n = 0;
		for(int i = 1;i<size ;i*=range){
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
		
		return block;
	}

	
	public void simulateFree(MemoryBlock block, OperationInfo info){
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
}
