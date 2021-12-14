package vn.ansv.Controller.Chief;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Service.CustomersServiceImpl;
import vn.ansv.Service.ProjectServiceImpl;
import vn.ansv.Service.ProjectTypesServiceImpl;
import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class ChiefBaseController {

	@Autowired
	ProjectTypesServiceImpl _projectTypesService;
	
	@Autowired
	ProjectServiceImpl _projectService;
	
	@Autowired
	CustomersServiceImpl _customersService;
	
	@Autowired
	UsersServiceImpl _usersService;
	
	public ModelAndView _mvShare = new ModelAndView();
	
	public ModelAndView InitCEO(int week) {
		_mvShare.addObject("project_types", _projectTypesService.getAllByWeek(week));
		_mvShare.addObject("customers", _customersService.getAllByWeek(week));
		_mvShare.addObject("pic", _usersService.getAllByWeek(week));
		_mvShare.addObject("menu_project", _projectService.getMenu(week));
		
		return _mvShare;
	}
	
}
