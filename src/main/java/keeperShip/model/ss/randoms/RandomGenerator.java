package keeperShip.model.ss.randoms;

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
//	    System.out.println(r);
	    for (int pos = 0; pos < buckets.length; pos++) {
	        r -= buckets[pos];
	        if (r <= 0) return pos;
	    }
	    return 0;
	}

	private long getNumber(int log){
		log = log==0?0:log-1;
		return log==0?0:(1l << log) + (int)(rand.nextDouble() * ((1l << log) - 1));
	}
	
	public long Emalloc(){
		long ret = getNumber(markovState);
		markovState = getBucket(context.E_malloc[markovState]);
		return ret;
	}
	
	public long Esize(){
		sizeBucket = getBucket(context.E_size);
		return getNumber(sizeBucket);
	}
	
	public long Efree(){
		int bucket = getBucket(context.E_life[sizeBucket] );
		return getNumber(bucket > 20?20:bucket);
	}
	
	public boolean Eorder(){
		return rand.nextBoolean();
	}
	

}
