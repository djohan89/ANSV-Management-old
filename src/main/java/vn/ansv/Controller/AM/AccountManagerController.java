package vn.ansv.Controller.AM;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="AM_HomeController")
@RequestMapping("AM")
public class AccountManagerController extends AccountManagerBaseController {

	@RequestMapping(value = { "/dashboard/{week}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week) {
		
		_mvShare.addObject("project_types", _projectTypesService.getAllByWeek(week));
		_mvShare.addObject("customers", _customersService.getAllByWeek(week));
		_mvShare.addObject("pic", _usersService.getAllByWeek(week));
		_mvShare.addObject("project", _projectService.getAllByWeek(week));
		_mvShare.setViewName("AM/am_dashboard"); 
		
		return _mvShare;
	}
	
}
