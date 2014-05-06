package memory;

import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public class Bin {
	List<MemoryBlock> blocks = new LinkedList<MemoryBlock>();

	private Comparator<MemoryBlock> comparator;

	private Bin() {

	}

	static Bin Lifo() {
		Bin bin = new Bin();
		bin.comparator = new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return (int)(b1.getSize() - b2.getSize());
			}

		};
		return bin;
	}

	static Bin Fifo() {
		Bin bin = new Bin();
		bin.comparator = new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return (int)(b2.getSize() - b1.getSize());
			}

		};
		return bin;
	}

	static Bin Random() {
		Bin bin = new Bin();
		bin.comparator = new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return 0;
			}

		};
		return bin;
	}

	MemoryBlock getAndRemoveBlock(int size, OperationInfo info) {
		Iterator<MemoryBlock> iterator = blocks.iterator();
		while (iterator.hasNext()) {
			MemoryBlock block = iterator.next();
			info.steps++;
			if (block.getSize() > size) {
				iterator.remove();
				return block;
			}
		}
		return null;
	}

	void addBlock(MemoryBlock block, OperationInfo info) {
		ListIterator<MemoryBlock> iterator = blocks.listIterator();

		MemoryBlock next;
		while (iterator.hasNext()) {
			next = iterator.next();
			info.steps++;
			if (comparator.compare(block, next) >= 0) {
				break;
			}
		}
		iterator.add(block);

	}

	public void removeBlock(MemoryBlock block) {
		blocks.remove(block);
		
	}
}
