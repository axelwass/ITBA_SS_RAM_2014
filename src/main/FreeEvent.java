package main;

import memory.MemoryBlock;

public class FreeEvent {
	long time;
	MemoryBlock block;
	
	public FreeEvent(long d, MemoryBlock block) {
		super();
		this.time = d;
		this.block = block;
	}
	
	
}
