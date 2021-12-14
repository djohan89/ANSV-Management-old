package vn.ansv.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class UserBaseController {
	
	@Autowired
	UsersServiceImpl usersService;
	
	public ModelAndView _mvShare = new ModelAndView();

	
}
