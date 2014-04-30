package memory;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Bin {
	List<MemoryBlock> blocks = new LinkedList<>();
	
	MemoryBlock getAndRemoveBlock(long size){
		Iterator<MemoryBlock> iterator = blocks.iterator();
		while (iterator.hasNext()) {
			MemoryBlock block = iterator.next();
			if(block.getSize()>size){
				iterator.remove();
				return block;
			}
		}
		return null;
	}
	
	
}
