package memory;

import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;

public class BestFitBin implements Bin {
	TreeSet<MemoryBlock> blocks = new TreeSet<MemoryBlock>();

	long maxSize = 0;
	
	//private Comparator<MemoryBlock> comparator;

	public BestFitBin() {
		blocks = new TreeSet<MemoryBlock>(new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return (int)(b1.getSize() - b2.getSize());//TODO cambiar esto
			}

		});
	}
	
	void updateMax(){
		maxSize = blocks.isEmpty()?0:blocks.last().getSize();
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
