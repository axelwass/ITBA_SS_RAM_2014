package randoms;

import java.util.Random;

public class RandomGenerator {
	Random rand = new Random(System.currentTimeMillis());
	
	public RandomGenerator() {
		// TODO Auto-generated constructor stub
	}
	
	public int Emalloc(){
		return (int)(rand.nextDouble()*100);
	}
	
	public int Efree(){
		return (int)(rand.nextDouble()*5);
	}
	
	public int Esize(){
		return (int)(rand.nextDouble()*2048);
	}
}
