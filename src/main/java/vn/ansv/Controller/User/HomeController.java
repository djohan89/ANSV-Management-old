package vn.ansv.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "User_HomeController")
public class HomeController extends UserBaseController {
	
	@RequestMapping(value = { "/AM/dashboard" }, method = RequestMethod.GET)
	public ModelAndView accountManagerHome() {
		
		_mvShare.setViewName("AM/am_dashboard");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/PM/dashboard" }, method = RequestMethod.GET)
	public ModelAndView projectManagerHome() {
		
		_mvShare.setViewName("PM/pm_dashboard");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/user/dashboard" }, method = RequestMethod.GET)
	public ModelAndView memberHome() {
		
		_mvShare.setViewName("user/user_dashboard");
		
		return _mvShare;
	}
	
}
