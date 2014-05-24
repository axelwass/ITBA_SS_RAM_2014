package memory;

import java.util.Iterator;
import java.util.LinkedList;

public class RandomBin implements Bin {

	LinkedList<MemoryBlock> blocks = new LinkedList<MemoryBlock>();

	long maxSize = 0;

	public RandomBin() {
	}
	
	void updateMax(){
		for(MemoryBlock block : blocks){
			if(block.getSize()>maxSize){
				maxSize = block.getSize();
			}
		}
	}

	public MemoryBlock getAndRemoveBlock(int size, OperationInfo info) {
		if(size>maxSize){
			return null;
		}
		Iterator<MemoryBlock> iterator = blocks.iterator();
		while (iterator.hasNext()) {
			MemoryBlock block = iterator.next();
			info.steps++;
			if (block.getSize() > size) {
				iterator.remove();
				if(block.getSize()>=maxSize){
					updateMax();
				}
				return block;
			}
		}
		return null;
	}

	public void addBlock(MemoryBlock block, OperationInfo info) {
		blocks.add(block);
		maxSize = Math.max(block.getSize(), maxSize);

	}

	public void removeBlock(MemoryBlock block) {
		blocks.remove(block);
		if(block.getSize()>=maxSize){
			updateMax();
		}
		
	}

	@Override
	public Iterator<MemoryBlock> iterator() {
		return blocks.iterator();
	}

	@Override
	public long getMaxSize() {
		return maxSize;
	}

}
