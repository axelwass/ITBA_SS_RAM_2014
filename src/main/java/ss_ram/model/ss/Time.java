package ss_ram.model.ss;

public enum Time {
	_1min(1000*60),_10min(1000*60*10),_1h(1000*60*60);
	
	
	private long simulationTime;
	
	private Time(long simulationTime) {
		this.simulationTime = simulationTime;
	}
	
	public long getSimulationTime(){
		return simulationTime;
	}


}
