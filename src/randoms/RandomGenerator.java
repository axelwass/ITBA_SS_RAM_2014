package randoms;

import java.io.BufferedReader;
import java.io.FileReader;
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
		
		String everything = "";
		BufferedReader br = new BufferedReader(new FileReader(contextPath));
	    try {
	        StringBuilder sb = new StringBuilder();
	        String line = br.readLine();

	        while (line != null) {
	            sb.append(line);
	            sb.append("\n");
	            line = br.readLine();
	        }
	        everything = sb.toString();
	    } finally {
	        br.close();
	    }
		
		
		context = gson.fromJson(everything, SimulationContext.class);
//		context = gson.fromJson(new String(Files.readAllBytes(FileSystems.getDefault().getPath(contextPath)),Charset.defaultCharset()), SimulationContext.class);
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
