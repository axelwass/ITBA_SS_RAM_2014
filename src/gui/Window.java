package gui;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.util.Map.Entry;

import javax.swing.JFrame;
import javax.swing.JPanel;

import memory.HistogramInformation;

public class Window extends JFrame{
	
	private static final long serialVersionUID = 1L;
	
	HistogramInformation histogram;
	
	long memorySize = 1;
	
	static int width = 1200;
	static int height = 900;
	
	public Window(long memorySize) {
		super("Ram Simulation");
		this.memorySize = memorySize;
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		getContentPane().add(new HistogramGraph());
		pack();
		setSize(new Dimension(width, height));
		setVisible(true);
	}
	
	public void setHistogram(HistogramInformation histogram) {
		this.histogram = histogram;
	}
	
	private class HistogramGraph extends JPanel{
		
		private static final long serialVersionUID = 1L;

		@Override
		public void paint(Graphics g) {
			Graphics2D g2D;
			g2D = (Graphics2D) g;
			int i = 0;
			if(histogram != null){
				for(Entry<HistogramInformation.Class,HistogramInformation.Value> entry: histogram){
					g2D.drawString("" + entry.getKey().start + " - " + entry.getKey().end, i* (width/histogram.getSize()), 40);
					g2D.drawRect(i* (width/histogram.getSize()), 40, width/histogram.getSize(),(int)((((double)(entry.getValue().unused + entry.getValue().used)/(double)memorySize)) * (height-100)  ));
					g2D.fillRect(i++* (width/histogram.getSize()), 40, width/histogram.getSize(),(int)((((double)entry.getValue().used/(double)memorySize)) * (height - 100) ));
					//g2D.drawRect(0,0,20,250);
					//g2D.drawRect(20,0,20,250);
					//g2D.fillRect(0,0,20,140);
				}
			}
			//super.paint(arg0);
		}
	}
	
}
