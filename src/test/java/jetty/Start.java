package jetty;

import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.PosixParser;
import org.mortbay.jetty.Connector;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.bio.SocketConnector;
import org.mortbay.jetty.webapp.WebAppContext;

import ss.model.ss.Contexts;
import ss.model.ss.main.Simulation;
import ss.model.ss.memory.OrderConfiguration;

public class Start {
	public static void main(String[] args) throws Exception {
		
		if(args.length == 0){
			Server server = new Server();
			SocketConnector connector = new SocketConnector();
			
			connector.setMaxIdleTime(1000 * 60 * 60);
			connector.setSoLingerTime(-1);
			connector.setPort(8080);
			server.setConnectors(new Connector[] { connector });
			WebAppContext bb = new WebAppContext();
			bb.setServer(server);
			bb.setContextPath("/ss");
			bb.setWar("src/main/webapp");
			server.addHandler(bb);
			try {
				System.out.println(">>> STARTING EMBEDDED JETTY SERVER, "
						+ "PRESS ANY KEY TO STOP");
				server.start();
				while (System.in.available() == 0) {
					Thread.sleep(5000);
				}
				server.stop();
				server.join();
			} catch (Exception e) {
				e.printStackTrace();
				System.exit(100);
			}
		}
		else{
			CommandLineParser parser = new PosixParser();
			
			Options options = new Options();
			options.addOption("h","help",false,"prints this help");
			options.addOption( "t", "simulation-time", true, "simulation time (seconds)" );
			options.addOption( "m", "memory-size", true, "memory size (Mb)" );
			options.addOption( "o", "list-order", true, "list order: BEST, WORST, RANDOM ");
			options.addOption( "r", "bin-range", true, "bin range");
			options.addOption( "c", "context", true, "context: VIM PHOTOSHOP" );
			options.addOption( "n", "cant", true, "cantidad de corridas" );
			try {
				
			    CommandLine line = parser.parse( options, args );
			    
			    if( line.hasOption( "h" ) ) {
			    	 HelpFormatter formatter = new HelpFormatter();
			    	 formatter.printHelp("SS_RAM", "Correr sin argumentos para iniciar como servidor web.\n-\nsimulacion de alocacion de memoria.", options, ";)", true);
			    }
			    else{
			    	try{
			    		//-n 10 -m 1024 -t 10800 -o RANDOM -r 2 -c PHOTOSHOP
				    	String simulation_time =line.getOptionValue("t", "3600");
				    	String memory_size = line.getOptionValue("m", "256");
				    	String list_order = line.getOptionValue("o", "best").toUpperCase();
				    	String bin_range = line.getOptionValue("r", "2");
				    	String context = line.getOptionValue("c", "excel").toUpperCase();
				    	
				    	int cant = Integer.parseInt(line.getOptionValue("n", "1"));
				    	
				    	Simulation simulations[] = new Simulation[cant];
				    	
				    	int step = 1;
			    		int range = 2;
			    		
				    	do{
				    		if(!bin_range.equals("a")){
				    			range = Integer.parseInt(bin_range);
				    		}
				    		
				    		
					    	for(int i = 0; i < cant;i+=step ){
					    		
					    		for(int j = 0; j<step && j+i<cant;j++){
						    		simulations[i+j] = new Simulation(Long.parseLong(simulation_time) * 1000, Long.parseLong(memory_size) * 1024 * 1024, OrderConfiguration.valueOf(list_order), range , Contexts.valueOf(context).getPath(), null);
						    		simulations[i+j].start();
					    		}
					    		boolean finished = false;
						    	while(!finished){
						    		//System.out.println("not yeat");
						    		finished = true;
						    		for(int j =0;j<step && j+i<cant;j++){
						    			finished &= simulations[i+j].waitFinish(5000);
						    		}
						    	}
					    	}
					    	
					    	String filename = "./resultados/CV_" +list_order + "-" + range + "-Context_" + context + "-" + simulation_time + "s-" + memory_size + "M.reultados";
					    	saveToFile(filename,simulations);
				    		if(bin_range.equals("a")){
				    			switch (range) {
								case 2:
									range  = 8;
									break;
								case 8:
									range  = 32;
									break;
								case 32:
									range  = -1;
									break;
								}
				    		}
				    	}while( bin_range.equals("a") && range != -1 );
					    	
			    	}catch(Exception e){
			    		e.printStackTrace();
			    		System.out.println("algun argumento esta mal, vuelva a intentarlo mas tarde. Probablemente es hora de dormir.");
			    	}
			    }
			}
			catch( ParseException exp ) {
			    System.out.println( "Unexpected exception:" + exp.getMessage() );
			}
		}
	}

	private static void saveToFile(String filename, Simulation[] simulations) {
		try
		{
		    FileWriter writer = new FileWriter(filename);
	 
		    while(simulations[0].getIterator().hasNext()){
			    for(int i =0;i<simulations.length;i++){
			    	writer.append("" + simulations[i].getIterator().next() + ",");
			    }
			    writer.append("\n");
		    }
	 
		    writer.flush();
		    writer.close();
		    
		}
		
		catch(IOException e)
		{
		     e.printStackTrace();
		} 
		
	}
}
