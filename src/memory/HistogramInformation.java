package memory;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class HistogramInformation {
	
	HashMap<Class, Value> histogram = new HashMap<Class, Value>();
	List<Class> classes = new LinkedList<Class>();
	
	public HistogramInformation(int range, long mamorySize) {
		
		for(long i = 1;i<mamorySize ;i*=range){
			Class c = new Class(i, i*range);
			histogram.put(c, new Value());
			classes.add(c);
		}
	}
	
	public void addUsed(MemoryBlock block){
		for(Class c: classes){
			if(c.start<=block.getSize() && block.getSize()<c.end){
				histogram.get(c).used += block.getSize();
			}
		}
	}
	
	public void addUnused(MemoryBlock block){
		for(Class c: classes){
			if(c.start<=block.getSize() && block.getSize()<c.end){
				histogram.get(c).unused += block.getSize();
			}
		}
	}
	
	@Override
	public String toString() {
		String ret = "\nHistograma:\n";
		for(Class c: classes){
			ret += c.start + "-" + c.end + " = used: " + histogram.get(c).used + " - unused: " + histogram.get(c).unused + "\n";
		}
		return ret;
	}
	
	private class Class{
		long start;
		long end;
		
		public Class(long start, long end) {
			super();
			this.start = start;
			this.end = end;
		}
		
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + getOuterType().hashCode();
			result = prime * result + (int) (end ^ (end >>> 32));
			result = prime * result + (int) (start ^ (start >>> 32));
			return result;
		}
		
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Class other = (Class) obj;
			if (!getOuterType().equals(other.getOuterType()))
				return false;
			if (end != other.end)
				return false;
			if (start != other.start)
				return false;
			return true;
		}
		
		private HistogramInformation getOuterType() {
			return HistogramInformation.this;
		}
		
		
	}
	
	private class Value{
		long used = 0;
		long unused = 0;
	}
}
