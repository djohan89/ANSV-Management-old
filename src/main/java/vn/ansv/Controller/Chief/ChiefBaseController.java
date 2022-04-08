package vn.ansv.Controller.Chief;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Dao.CustomersDao;
import vn.ansv.Entity.Project;
import vn.ansv.Service.CustomersServiceImpl;
import vn.ansv.Service.PicServiceImpl;
import vn.ansv.Service.PriorityServiceImpl;
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
	
	@Autowired
	PriorityServiceImpl _priorityService;
	
	@Autowired
	CustomersDao _customersDao;
	
	@Autowired
	PicServiceImpl _picService;
	public ModelAndView _mvShare = new ModelAndView();
	
	public ModelAndView InitCEO(int week, int year) {
		_mvShare.addObject("project_types", _projectTypesService.getMenu(week, year));	// Danh sách loại dự án hiển thị trên menu
		_mvShare.addObject("customers", _customersService.getMenu(week,year));			// Danh sách khách hàng hiển thị trên menu (theo loại dự án)
		_mvShare.addObject("pic", _usersService.getMenu(week,year)); 					// Danh sách PIC hiển thị trên menu
		_mvShare.addObject("statistics",_projectService.thong_ke(week,year)); 			// Đẩy dữ liệu thống kê lên giao diện (header)
		_mvShare.addObject("menu_project", _projectService.getMenu(week,year));			// Danh sách dự án hiển thị trên menu (theo PIC)
		
		
		return _mvShare;
	}
	public ModelAndView FormCEO() {
		_mvShare.addObject("customers_form",_customersService.getAllCustomerForm());
		_mvShare.addObject("priorities",_priorityService.getAllPriorityForm());
		_mvShare.addObject("status",_priorityService.getAllStatusForm());
		_mvShare.addObject("type",_priorityService.getAllTypeForm());
		
		return _mvShare;
	}
	
}
