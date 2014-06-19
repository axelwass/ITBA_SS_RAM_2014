package ss_ram.model.ss.memory;

import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;


public class WorstFitBin implements Bin {
	LinkedList<MemoryBlock> blocks = new LinkedList<MemoryBlock>();
	
	private Comparator<MemoryBlock> comparator;

	public WorstFitBin() {
		comparator = new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {
				int difference = (int)(b1.getSize() - b2.getSize());
				return difference==0?(int)(b1.start - b2.start):difference;
			}

		};
	}
	

	public MemoryBlock getAndRemoveBlock(long size, OperationInfo info) {
		if(blocks.isEmpty() || size>blocks.peek().getSize()){
			return null;
		}
		info.steps++;
		return blocks.pop();
	}

	public void addBlock(MemoryBlock block, OperationInfo info) {
		
		if(blocks.isEmpty() || block.getSize()>blocks.peek().getSize()){
			info.steps++;
			blocks.addFirst(block);
			return;
		}
		
		ListIterator<MemoryBlock> li = blocks.listIterator();
				
		while(li.hasNext()){
			MemoryBlock LiBlock = li.next();
			info.steps++;
			if(comparator.compare(block, LiBlock)<=0){
				li.previous();
				li.add(block);
				return;
			}
		}
		blocks.addLast(block);		
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
		return blocks.isEmpty()?0:blocks.peek().getSize();
	}

}
