package keeperShip.model.ss.memory;


public interface Bin extends Iterable<MemoryBlock> {
	
	MemoryBlock getAndRemoveBlock(long size, OperationInfo info);
	void addBlock(MemoryBlock block, OperationInfo info);
	public void removeBlock(MemoryBlock block);
	long getMaxSize();
}
