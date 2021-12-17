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

	@RequestMapping(value = { "/chief/customer_detail/{week}/{customer_id}" }, method = RequestMethod.GET)
	public ModelAndView chiefCustomer(@PathVariable int customer_id,@PathVariable int week) {
		
		InitCEO(week);
		_mvShare.addObject("customer",_projectService.getAllProjectByCustomerAndWeek(week, customer_id));
		_mvShare.setViewName("chief/customer_detail");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/chief/detail/{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefDetail(@PathVariable  int id) {
		
		
		
		_mvShare.addObject("detail",_projectService.getAllDetailById(id));
		_mvShare.setViewName("chief/detail");
		
		return _mvShare;
	}
}
