package gui;

public enum Contexts {
excel("./context/samples/excel.json"),vim("./context/samples/vim.json");//,skype,iTunes,photoshop,safari()


private String path;

private Contexts(String path) {
	this.path = path;
}

public String getPath(){
	return path;
}


}
