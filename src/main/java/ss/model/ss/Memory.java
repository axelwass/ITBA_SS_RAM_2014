package ss.model.ss;

public enum Memory {
		
	_1G(1024*1024*1024),_512K(512 * 1024 * 1024),_256K(256 * 1024 * 1024);
	
	private long memorySize;
	
	private Memory(long memorySize) {
		this.memorySize = memorySize;
	}
	
	public long getMemorySize(){
		return memorySize;
	}


}
