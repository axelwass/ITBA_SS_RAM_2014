package keeperShip.model.ss.memory;

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
				int difference = (int)(b1.getSize() - b2.getSize());
				return difference==0?(int)(b1.start - b2.start):difference;
			}

		});
	}
	
	void updateMax(OperationInfo info){
		maxSize = blocks.isEmpty()?0:blocks.last().getSize();
		if(info  != null && !blocks.isEmpty()) info.steps +=  Math.log10(blocks.size())/Math.log10(2);
	}

	public MemoryBlock getAndRemoveBlock(long size, OperationInfo info) {
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
					updateMax(info);
				}
				return block;
			}
		}
		return null;
	}

	public void addBlock(MemoryBlock block, OperationInfo info) {
		blocks.add(block);
		maxSize = Math.max(block.getSize(), maxSize);
		info.steps +=  Math.log10(blocks.size())/Math.log10(2);

	}

	public void removeBlock(MemoryBlock block) {
		blocks.remove(block);
		if(block.getSize()>=maxSize){
			updateMax(null);
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
