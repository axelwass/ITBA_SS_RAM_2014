package keeperShip.web.command;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map.Entry;

import javax.imageio.ImageIO;

import keeperShip.model.ss.memory.HistogramInformation;

public class ImageConteiner {
	
	static final int width = 800;
	static final int height = 500;
	BufferedImage bi;
	boolean updated = false;
	
	private String formatMemorySizeString(long size){
		long _1G = 1024*1024*1024;
		long _1M = 1024*1024;
		long _1K = 1024;
		if(size>= _1G){
			return "" + size / _1G + "Gb";
		} 
		else if(size>= _1M){
			return "" + size / _1M + "Mb";
		}
		else if(size>= _1K){
			return "" + size / _1K + "Kb";
		}
		return  "" + size + "b";
	}
	
	public synchronized void updateImage(HistogramInformation histogram){
		bi = new BufferedImage(width, height,BufferedImage.TYPE_BYTE_INDEXED);
		Graphics2D g2d = bi.createGraphics();
		g2d.setPaintMode();
		g2d.setColor(Color.WHITE);
		g2d.fillRect(0, 0, width, height);
		int i = 0;
		for(Entry<HistogramInformation.Class,HistogramInformation.Value> entry: histogram){
			//System.out.println("1: " + (i* (width/histogram.getSize())) + " -3: " + (width/histogram.getSize()) + " -4: " + (((double)(entry.getValue().unused + entry.getValue().used)/(double)histogram.getMemorySize()) * height));
			g2d.setColor(Color.BLACK);
			g2d.drawString("From:" + formatMemorySizeString(entry.getKey().start), i* (width/histogram.getSize()), 28);
			g2d.drawString("To:" + formatMemorySizeString(entry.getKey().end), i* (width/histogram.getSize()), 38);
			g2d.fillRect(i* (width/histogram.getSize()), 40, width/histogram.getSize(),(int)((((double)(entry.getValue().unused + entry.getValue().used)/(double)histogram.getMemorySize())) * (height-100)  ));
			g2d.setColor(Color.GRAY);
			g2d.fillRect(i++* (width/histogram.getSize()), 40, width/histogram.getSize(),(int)((((double)entry.getValue().used/(double)histogram.getMemorySize())) * (height - 100) ));
		}
		g2d.dispose();
		updated = true;
	}

	public synchronized void write(OutputStream output) throws IOException {
		System.out.println("TOMA ESTO!");
		if(bi != null){
			ImageIO.write(bi,"png",output);
			updated = false;
		}
	}
	
	public synchronized boolean isUpdated() {
		return updated;
	}
	
}