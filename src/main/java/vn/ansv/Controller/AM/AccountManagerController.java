package vn.ansv.Controller.AM;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="AM_HomeController")
@RequestMapping("AM")
public class AccountManagerController extends AccountManagerBaseController {

	@RequestMapping(value = { "/dashboard/{week}" }, method = RequestMethod.GET)
	public ModelAndView AmHome(@PathVariable int week,HttpSession session) {
		
		InitAM(week);
		String pic_id = (String) session.getAttribute("user_id");
		_mvShare.addObject("project_table_pic",_projectService.getDashboardTableByPIC(week,pic_id )); // Dữ liệu khái quát hiển thị lên dashboard (datatable)

		_mvShare.setViewName("AM/am_dashboard"); 
		
		return _mvShare; 
	}
	
	@RequestMapping(value = { "/detail/{week}/{id}" }, method = RequestMethod.GET)
	public ModelAndView AmDetail(@PathVariable int week, @PathVariable  int id) {
		
		
		InitAM(week);
		_mvShare.addObject("detail",_projectService.getAllDetailById(week,id));
		_mvShare.setViewName("AM/detail");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/update/{week}/{id}" }, method = RequestMethod.GET)
	public ModelAndView AmUpdate(@PathVariable int week, @PathVariable  int id) {
		
		
		InitAM(week);
		_mvShare.addObject("detail",_projectService.getAllDetailById(week,id));
		_mvShare.addObject("customers",_customersService.getAllCustomer());
		_mvShare.addObject("priorities",_priorityService.getAllPriority());
		_mvShare.addObject("status",_priorityService.getAllStatus());
		_mvShare.addObject("type",_priorityService.getAllType());
		_mvShare.setViewName("AM/update");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/create/{week}" }, method = RequestMethod.GET)
	public ModelAndView AmCreate(@PathVariable int week) {
		
		
		InitAM(week);
		_mvShare.addObject("customers",_customersService.getAllCustomer());
		_mvShare.addObject("priorities",_priorityService.getAllPriority());
		_mvShare.addObject("status",_priorityService.getAllStatus());
		_mvShare.addObject("type",_priorityService.getAllType());
		_mvShare.setViewName("AM/create");
		
		return _mvShare;
	}
}
