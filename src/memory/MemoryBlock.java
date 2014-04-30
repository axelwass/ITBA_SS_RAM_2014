package memory;

public class MemoryBlock {
	long start;
	long end;
	
	boolean free;
	
	long getSize(){
		return end-start;
	}
}
