package memory;

import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.TreeSet;

public class WorstFitBin implements Bin{
	
	PriorityQueue<MemoryBlock> blocks;

	public WorstFitBin() {
		blocks = new PriorityQueue<MemoryBlock>(10, new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {
				int difference = (int)(b2.getSize() - b1.getSize());
				return difference==0?((int)(b1.start - b2.start) == 0? 0:-1 ):difference;
			}
		});
	}

	public MemoryBlock getAndRemoveBlock(int size, OperationInfo info) {
		if(blocks.isEmpty() || blocks.peek().getSize()< size){
			return null;
		}
		return blocks.poll();
	}

	public void addBlock(MemoryBlock block, OperationInfo info) {
		blocks.add(block);
	}

	public void removeBlock(MemoryBlock block) {
		blocks.remove(block);
	}

	@Override
	public Iterator<MemoryBlock> iterator() {
		return blocks.iterator();
	}

	@Override
	public long getMaxSize() {
		return blocks.peek().getSize();
	}

}
