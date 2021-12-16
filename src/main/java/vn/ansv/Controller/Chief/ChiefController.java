package vn.ansv.Controller.Chief;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
	@RequestMapping(value = { "/chief/dashboard/{week}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week) {
		
		InitCEO(week);
		_mvShare.addObject("project",_projectService.getAllByWeek(week));
		
		_mvShare.setViewName("chief/chief_dashboard");
		
		return _mvShare;
	}

	@RequestMapping(value = { "/chief/project_details/{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefCustomer(@PathVariable int id) {
		
		
		
		_mvShare.setViewName("chief/project_details");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/chief/detail_tk/{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefDetail(@PathVariable  int id) {
		
		
		
		_mvShare.addObject("detail",_projectService.getAllDetailByweek(id));
		_mvShare.setViewName("chief/detail_tk");
		
		return _mvShare;
	}
}
