package main;

import memory.MemoryBlock;
import memory.MemoryManager;
import memory.OperationInfo;
import memory.OrderConfiguration;

public class Simulation {
	
	public static void main(String[] args) {
		System.out.println("start!");
		OperationInfo createOperationInfo = new OperationInfo();
		MemoryManager manager = new MemoryManager(32, OrderConfiguration.RANDOM,
				1024 * 1024 * 1024, 16,createOperationInfo);
		OperationInfo mallocOperationInfo = new OperationInfo();
		MemoryBlock block = manager.simulateMalloc(1024, mallocOperationInfo);
		OperationInfo freeOperationInfo = new OperationInfo();
		manager.simulateFree(block,freeOperationInfo);
		
		System.out.println("createOperationInfo: steps= " + createOperationInfo.steps);
		System.out.println("mallocOperationInfo: steps= " + mallocOperationInfo.steps + " overflow= " + mallocOperationInfo.overflow);
		System.out.println("freeOperationInfo: steps= " + freeOperationInfo.steps);
	}
}
