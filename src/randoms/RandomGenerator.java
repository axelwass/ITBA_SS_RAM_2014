package randoms;

import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.util.Random;

import com.google.gson.Gson;

public class RandomGenerator {
	Random rand = new Random(System.currentTimeMillis());
	SimulationContext context;
	int markovState;
	int sizeBucket = 0;
	
	public RandomGenerator(String contextPath){
		try{
		Gson gson = new Gson();
		
		context = gson.fromJson(new String(Files.readAllBytes(FileSystems.getDefault().getPath(contextPath)),Charset.defaultCharset()), SimulationContext.class);
		markovState = context.E_malloc_start;
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private int getBucket(double[] buckets){
	    double r = rand.nextDouble();
	    for (int pos = 0; pos < buckets.length; pos++) {
	        r -= buckets[pos];
	        if (r <= 0) return pos;
	    }
	    return buckets.length-1;
	}

	private int getNumber(int log){
		return (1 << log) + (int)(rand.nextDouble() * ((1 << log) - 1));
	}
	
	public int Emalloc(){
		int ret = getNumber(markovState); 
		markovState = getBucket(context.E_malloc[markovState]);
		return ret;
	}
	
	public int Esize(){
		sizeBucket = getBucket(context.E_size);
		return getNumber(sizeBucket);
	}
	
	public int Efree(){
		return getNumber(getBucket(context.E_life[sizeBucket]));
	}
	

}
