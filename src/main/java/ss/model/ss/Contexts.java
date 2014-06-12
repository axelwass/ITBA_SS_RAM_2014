package ss.model.ss;

public enum Contexts {
	EXCEL("EXCEL","./context/samples/excel.json"),
	SKYPE("VIM","./context/samples/skype.json"),
	ITUNES("ITUNES","./context/samples/iTunes.json"),
	PHOTOSHOP("PHOTOSHOP","./context/samples/photoshop.json"),
	SAFARI("SAFARI","./context/samples/safari.json");
	
	
	private String path;
	private String name;
	
	private Contexts(String name,String path) {
		this.name = name;
		this.path = path;
	}
	
	public boolean is(String name){
		return this.name.equals(name);
	}
	
	public String getPath(){
		return path;
	}


}
