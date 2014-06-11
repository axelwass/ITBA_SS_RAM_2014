package keeperShip.web;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import keeperShip.model.ss.Contexts;
import keeperShip.model.ss.Memory;
import keeperShip.model.ss.Range;
import keeperShip.model.ss.Time;
import keeperShip.model.ss.main.Simulation;
import keeperShip.model.ss.memory.OrderConfiguration;
import keeperShip.web.command.ImageConteiner;
import keeperShip.web.command.SimulationForm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SSController {

	Simulation sim;
	ImageConteiner image = new ImageConteiner();
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView form() {

		if(sim != null){
			return new ModelAndView("redirect:init");
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("simulationForm", new SimulationForm(Time._10min, Memory._1G, OrderConfiguration.BEST, Range._32, Contexts.EXCEL));
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
		return new ModelAndView();
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
