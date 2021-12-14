package vn.ansv.Controller.Admin;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class AdminBaseController {
	@Autowired
	UsersServiceImpl _usersService;
	
	public ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView InitAdmin() {
		return _mvShare;
	}
}
