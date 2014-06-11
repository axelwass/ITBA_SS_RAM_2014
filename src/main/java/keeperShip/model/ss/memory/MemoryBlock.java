package keeperShip.model.ss.memory;

public class MemoryBlock {
	long start;
	long end;
	
	public MemoryBlock(long start, long end) {
		this.start = start;
		this.end = end;
	}
	
	long getSize(){
		return end-start+1;
	}

	public MemoryBlock splitt(long size, int MinSize) {
		MemoryBlock other = null;
		if(size<getSize()-MinSize ){
			other = new MemoryBlock(start + size + 1, end);
			this.end = start+size;
		}
		return other;
	}

	public void coaliseNext(MemoryBlock next) {
		if(end + 1 == next.start){
			this.end = next.end;
		}
		else{
			System.out.println("coalising error!");
		}
	}

	public void coalisePrevious(MemoryBlock previous) {
		if(start - 1 == previous.end){
			this.start = previous.start;
		}
		else{
			System.out.println("coalising error!");
		}
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemoryBlock other = (MemoryBlock) obj;
		if (end != other.end)
			return false;
		if (start != other.start)
			return false;
		return true;
	}
	

}
