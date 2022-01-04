package vn.ansv.Controller.AM;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Entity.Project;

@Controller(value="AM_HomeController")
@RequestMapping("AM")
public class AccountManagerController extends AccountManagerBaseController {

	// Hàm lấy số tuần
	public int getWeekOfYear(Date date) {
		
		Calendar calendar = new GregorianCalendar();
    	calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setMinimalDaysInFirstWeek(3);
		calendar.setTime(date);
		int week = calendar.get(Calendar.WEEK_OF_YEAR);
		
		return week;
	}
	
	@RequestMapping(value = { "/dashboard/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView AmHome(@PathVariable int week, @PathVariable int year, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table_pic",_projectService.getDashboardTableByPIC(week, year, pic_id));
		_mvShare.setViewName("AM/am_dashboard"); 
		return _mvShare; 
	}
	
	@RequestMapping(value = { "/detail/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView AmDetail(@PathVariable int week, @PathVariable int year, @PathVariable  int id, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		_mvShare.addObject("detail",_projectService.getByIdAndPic(id, pic_id));
		_mvShare.setViewName("AM/detail");
		return _mvShare;
	}
	
//	@RequestMapping(value = { "/create/{week}_{year}" }, method = RequestMethod.GET)
//	public ModelAndView AmCreate(@PathVariable int week, @PathVariable int year) {
//		InitAM(week, year);
//		_mvShare.addObject("customers",_customersService.getAllCustomerForm());
//		_mvShare.addObject("priorities",_priorityService.getAllPriorityForm());
//		_mvShare.addObject("status",_priorityService.getAllStatusForm());
//		_mvShare.addObject("type",_priorityService.getAllTypeForm());
//		_mvShare.setViewName("AM/create");
//		return _mvShare;
//	}
	
	@RequestMapping(value = { "/update/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView AmUpdate(@PathVariable int week, @PathVariable int year, @PathVariable  int id, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		_mvShare.addObject("detail",_projectService.getById(id));
		_mvShare.addObject("customers",_customersService.getAllCustomerForm());
		_mvShare.addObject("priorities",_priorityService.getAllPriorityForm());
		_mvShare.addObject("status",_priorityService.getAllStatusForm());
		_mvShare.addObject("type",_priorityService.getAllTypeForm());
		_mvShare.setViewName("AM/update");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/create/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView AmCreateTest(@PathVariable int week, @PathVariable int year, Model model, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		int Project_new_id = _projectService.getMaxId() + 1;
		InitAM(week, year, pic_id);
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		model.addAttribute("project", new Project());
		
		_mvShare.addObject("current_week", current_week);
		_mvShare.addObject("current_year", current_year);
		_mvShare.addObject("project_new_id", Project_new_id);
		_mvShare.addObject("customers",_customersService.getAllCustomerForm());
		_mvShare.addObject("priorities",_priorityService.getAllPriorityForm());
		_mvShare.addObject("status",_priorityService.getAllStatusForm());
		_mvShare.addObject("type",_priorityService.getAllTypeForm());
		_mvShare.setViewName("AM/create_new");
		return _mvShare;
	}
	
	@RequestMapping("/insertProject/{week}_{year}")
	public String doSaveCustomer(@PathVariable int week, @PathVariable int year, @ModelAttribute("Project") Project project, Model model, HttpSession session) {
		
		String pic_id = (String) session.getAttribute("user_id");
		int project_id = project.getId();
		_projectService.save(project); // Insert dữ liệu dự án mới
		_picService.save(project_id, pic_id); // Insert PIC tương ứng của dự án

		return "redirect:/AM/dashboard/" + week + "_" + year;
	}
}
