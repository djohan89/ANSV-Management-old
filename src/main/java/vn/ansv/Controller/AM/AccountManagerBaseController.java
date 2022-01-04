package vn.ansv.Controller.AM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Dao.CustomersDao;
import vn.ansv.Service.CustomersServiceImpl;
import vn.ansv.Service.PicServiceImpl;
import vn.ansv.Service.PriorityServiceImpl;
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
	
	@Autowired
	PriorityServiceImpl _priorityService;
	
	@Autowired
	CustomersDao _customersDao;
	
	@Autowired
	PicServiceImpl _picService;
	
	public ModelAndView _mvShare = new ModelAndView();
	
	public ModelAndView InitAM(int week, int year, String pic) {
		_mvShare.addObject("project_types", _projectTypesService.getMenuByPic(week, year, pic));	// Danh sách loại dự án hiển thị trên menu
		_mvShare.addObject("customers_count", _customersDao.getCount());							// Lấy ra tổng số bản ghi khách hàng
		
		return _mvShare;
	}
	
}
