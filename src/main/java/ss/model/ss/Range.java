package ss.model.ss;

public enum Range {

	_2(2),_8(8),_32(32),_128(128);
	
	private int range;
	
	private Range(int range) {
		this.range = range;
	}
	
	public int getRange(){
		return range;
	}

}
