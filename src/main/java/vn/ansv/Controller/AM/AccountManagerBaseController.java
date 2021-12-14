package vn.ansv.Controller.AM;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Service.CustomersServiceImpl;
import vn.ansv.Service.ProjectServiceImpl;
import vn.ansv.Service.ProjectTypesServiceImpl;
import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class AccountManagerBaseController {
	@Autowired
	ProjectTypesServiceImpl _projectTypesService;
	
	@Autowired
	ProjectServiceImpl _projectService;
	
	@Autowired
	CustomersServiceImpl _customersService;
	
	@Autowired
	UsersServiceImpl _usersService;
	
	public ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView InitAM() {
		return _mvShare;
	}
	
}
