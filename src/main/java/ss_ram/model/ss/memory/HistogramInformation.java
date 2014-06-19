package ss_ram.model.ss.memory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class HistogramInformation implements Iterable<Entry<HistogramInformation.Class,HistogramInformation.Value>> {
	
	long timer;
	long memorySize;
	HashMap<Class, Value> histogram = new HashMap<Class, Value>();
	List<Class> classes = new LinkedList<Class>();
	
	public HistogramInformation(int range, long memorySize, long time) {
		this.memorySize = memorySize;
		this.timer = time;
		for(long i = 1;i<memorySize ;i*=range){
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
	
	public int getSize(){
		return classes.size();
	}
	
	public long getMemorySize() {
		return memorySize;
	}

	@Override
	public Iterator<Entry<HistogramInformation.Class, HistogramInformation.Value>> iterator() {
		List<Entry<HistogramInformation.Class, HistogramInformation.Value>> list = new ArrayList<Map.Entry<HistogramInformation.Class, HistogramInformation.Value>>(histogram.entrySet());
		Collections.sort(list, new Comparator<Entry<HistogramInformation.Class, HistogramInformation.Value>>() {

			@Override
			public int compare(Entry<Class, Value> o1, Entry<Class, Value> o2) {
				return (int)(o1.getKey().start -  o2.getKey().start);
			}


		});
		return list.iterator();
	}
	
	@Override
	public String toString() {
		String ret = "\nHistograma:\n";
		for(Class c: classes){
			ret += c.start + "-" + c.end + " = used: " + histogram.get(c).used + " - unused: " + histogram.get(c).unused + "\n";
		}
		return ret;
	}
	
	public class Class{
		public long start;
		public long end;
		
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
	
	public class Value{
		public long used = 0;
		public long unused = 0;
	}

	public long getTimer() {
		return timer;
	}

}
