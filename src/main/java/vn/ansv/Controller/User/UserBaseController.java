package vn.ansv.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Service.ProjectServiceImpl;
import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class UserBaseController {
	
	@Autowired
	ProjectServiceImpl _projectService;
	
	@Autowired
	UsersServiceImpl usersService;
	
	public ModelAndView _mvShare = new ModelAndView();

	public ModelAndView InitUser(int week) {
		
		return _mvShare;
	}
}
