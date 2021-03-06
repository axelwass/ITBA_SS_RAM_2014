package ss_ram.web.command;

import ss_ram.model.ss.Contexts;
import ss_ram.model.ss.Memory;
import ss_ram.model.ss.Range;
import ss_ram.model.ss.Time;
import ss_ram.model.ss.main.Simulation;
import ss_ram.model.ss.memory.OrderConfiguration;

public class SimulationForm {
	Time simulationTime;
	Memory memorySize;
	OrderConfiguration order;
	Range range;
	Contexts context;
	
	
	
	public SimulationForm() {
	}

	public SimulationForm(Time simulationTime, Memory memorySize,
			OrderConfiguration order, Range range, Contexts context) {
		this.simulationTime = simulationTime;
		this.memorySize = memorySize;
		this.order = order;
		this.range = range;
		this.context = context;
	}

	public Time getSimulationTime() {
		return simulationTime;
	}

	public void setSimulationTime(Time simulationTime) {
		this.simulationTime = simulationTime;
	}

	public Memory getMemorySize() {
		return memorySize;
	}

	public void setMemorySize(Memory memorySize) {
		this.memorySize = memorySize;
	}

	public OrderConfiguration getOrder() {
		return order;
	}

	public void setOrder(OrderConfiguration order) {
		this.order = order;
	}

	public Range getRange() {
		return range;
	}

	public void setRange(Range range) {
		this.range = range;
	}

	public Contexts getContext() {
		return context;
	}

	public void setContext(Contexts context) {
		this.context = context;
	}
	
	public Simulation build(ImageConteiner image){
		return new Simulation(simulationTime.getSimulationTime(), memorySize.getMemorySize(), order, range.getRange(), context.getPath(), image);
	}
}
