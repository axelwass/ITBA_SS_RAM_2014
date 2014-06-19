package ss_ram.web;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ss_ram.model.ss.Contexts;
import ss_ram.model.ss.Memory;
import ss_ram.model.ss.Range;
import ss_ram.model.ss.Time;
import ss_ram.model.ss.main.Simulation;
import ss_ram.model.ss.memory.OrderConfiguration;
import ss_ram.web.command.ImageConteiner;
import ss_ram.web.command.SimulationForm;

@Controller
public class SSController {

	Simulation sim;
	ImageConteiner image = new ImageConteiner();
	SimulationForm form = new SimulationForm(Time._1h, Memory._1G, OrderConfiguration.RANDOM, Range._2, Contexts.SAFARI);
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView form() {

		if(sim != null){
			return new ModelAndView("redirect:init");
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("simulationForm", form);
		mav.addObject("time",Time.values());
		mav.addObject("memory",Memory.values());
		mav.addObject("orderConfiguration",OrderConfiguration.values());
		mav.addObject("range",Range.values());
		mav.addObject("context",Contexts.values());
		return mav;

	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView init() {
		if(sim == null){
			return new ModelAndView("redirect:form");
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("simulationForm", form);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView stop() {
		if(sim != null){
			sim.stop();
			sim = null;
		}
		return new ModelAndView("redirect:form");
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView init(SimulationForm sf) {
		form = sf;
		sim = sf.build(image);
		
		sim.start();
		
		return new ModelAndView("redirect:init");
	}
	
/*	@RequestMapping(method = RequestMethod.GET)
	public void isImageUpdated(HttpServletResponse resp){

		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		resp.setDateHeader("Expires", 0); // Proxies.
		
		try {
			resp.getOutputStream().write("false".getBytes(Charset.forName("UTF-8")));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}*/
	
	
	@RequestMapping(method = RequestMethod.GET)
	public void getHisogram(HttpServletResponse resp) {
		if(sim == null){
			return;
		}
		resp.setContentType("image/png");
		resp.setHeader("Content-Disposition", "inline; filename=\"imagen\"");
		
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		resp.setDateHeader("Expires", 0); // Proxies.
		
		OutputStream output = null;
		try {
			output =  resp.getOutputStream();
			image.write(output);
			output.close();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}
}
