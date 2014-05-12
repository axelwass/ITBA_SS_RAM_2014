package memory;

import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import java.util.TreeSet;

public class Bin {
	TreeSet<MemoryBlock> blocks = new TreeSet<MemoryBlock>();

	//private Comparator<MemoryBlock> comparator;

	private Bin(Comparator<MemoryBlock> comparator) {
		blocks = new TreeSet<MemoryBlock>(comparator);
	}

	static Bin Lifo() {
		Bin bin = new Bin(new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return (int)(b1.getSize() - b2.getSize());
			}

		});
		return bin;
	}

	static Bin Fifo() {
		Bin bin = new Bin(new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return (int)(b2.getSize() - b1.getSize());
			}

		});
		return bin;
	}

	static Bin Random() {
		Bin bin = new Bin(new Comparator<MemoryBlock>() {

			@Override
			public int compare(MemoryBlock b1, MemoryBlock b2) {

				return b1.start == b2.start && b1.end == b2.end?0:-1;
			}

		});
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
		blocks.add(block);
		/*Iterator<MemoryBlock> iterator = blocks.descendingIterator();

		MemoryBlock next;
		while (iterator.hasNext()) {
			next = iterator.next();
			info.steps++;
			if (comparator.compare(block, next) >= 0) {
				break;
			}
		}
		iterator.add(block);*/

	}

	public void removeBlock(MemoryBlock block) {
		blocks.remove(block);
		
	}
}
