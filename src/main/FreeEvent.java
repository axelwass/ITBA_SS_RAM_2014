package main;

import memory.MemoryBlock;

public class FreeEvent {
	int time;
	MemoryBlock block;
	
	public FreeEvent(int d, MemoryBlock block) {
		super();
		this.time = d;
		this.block = block;
	}
	
	
}
