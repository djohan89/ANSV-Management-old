package vn.ansv.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "Admin_HomeController")
@RequestMapping("admin")
public class AdminHomeController extends AdminBaseController {
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView indexWeb() {
		_mvShare.setViewName("admin/ad_dashboard");
		return _mvShare;
	}
	@RequestMapping(value = "/list_user", method = RequestMethod.GET)
	public ModelAndView ad_listUser() {
		_mvShare.addObject("users",_usersService.getAllUsers());
		_mvShare.setViewName("admin/ad_listUser");
		return _mvShare;
	}
	
}
