package vn.ansv.Controller.AM;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Dto.ProjectDetailDto;
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
		_mvShare.addObject("project_table_pic",_projectService.getDashboardAM(week, year, pic_id));
		_mvShare.setViewName("AM/am_dashboard"); 
		return _mvShare; 
	}
	
	@RequestMapping(value = { "/detail/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView AmDetail(@PathVariable int week, @PathVariable int year, @PathVariable int id, HttpSession session) {
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
	
	// Link đến form insert dự án
	@RequestMapping(value = { "/create_project/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView AmCreateProject(@PathVariable int week, @PathVariable int year, Model model, HttpSession session) {
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
		FormAM(); // Gọi hàm lấy dữ liệu cần thiết cho form báo cáo đầu ra
		_mvShare.setViewName("AM/create_new");
		return _mvShare;
	}
	
	// Thực thi insert dự án
	@RequestMapping("/insertProject/{week}_{year}")
	public String doInsertProject(@PathVariable int week, @PathVariable int year, @ModelAttribute("Project") Project project, Model model, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		int project_id = project.getId();
		_projectService.save(project); // Insert dữ liệu dự án mới
		_picService.save(project_id, pic_id); // Insert PIC tương ứng của dự án
		
		String week_link = "";
		if (project.getWeek() < 10) {
			week_link = "0" + project.getWeek();
		}
		
		// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
		return "redirect:/AM/dashboard/" + week_link + "_" + project.getYear();
	}
	
	// Thực thi xoá dự án
	@RequestMapping("/delete_project/{week}_{year}_{id}")
	public String doDeleteProject(@PathVariable int week, @PathVariable int year, @PathVariable int id) {
		_picService.delete(id);
		_projectService.delete(id);
		
		// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
		return "redirect:/AM/dashboard/" + week + "_" + year;
	}
	
	// Link đến form update dự án
	@RequestMapping(value = { "/update_project/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView AmUpdateProject(@PathVariable int week, @PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		_mvShare.addObject("detail",_projectService.getById(id));
		FormAM(); // Gọi hàm lấy dữ liệu cần thiết cho form báo cáo đầu ra
		
		int check_type = _projectService.getTypeForProject(id);
		if (check_type == 1) {
			List<ProjectDetailDto> project = _projectService.getById(id);
			model.addAttribute("project", project);
		} else {
			Project project = _projectService.getLessById(id, pic_id);
			model.addAttribute("project", project);
		}
		
		_mvShare.setViewName("AM/update");
		return _mvShare;
	}
	
	// Thực thi update dự án
	@RequestMapping("/updateProject/{week}_{year}_{id}")
	public String doUpdateProject(@ModelAttribute("Project") Project project, @PathVariable int week, @PathVariable int year, @PathVariable int id, Model model) {
		_projectService.update(project);
		
		return "redirect:/AM/dashboard/" + week + "_" + year;
	}
	
	// Link đến form chuyển giai đoạn dự án
	@RequestMapping("/deployment/{week}_{year}_{id}")
	public ModelAndView nextStepProject(@ModelAttribute("Project") Project project, @PathVariable int week, @PathVariable int year, @PathVariable int id, 
			HttpSession session, Model model) {
		String pic_id = (String) session.getAttribute("user_id");
		int Project_new_id = _projectService.getMaxId() + 1;
		InitAM(week, year, pic_id);
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		model.addAttribute("project", new Project());
		
		_mvShare.addObject("pic_form", _usersService.getAllPicForm());
		
		_mvShare.addObject("current_week", current_week);
		_mvShare.addObject("current_year", current_year);
		_mvShare.addObject("project_new_id", Project_new_id);
		_mvShare.addObject("project_old", _projectService.getFormDeployment(id)); // Lấy ra thông tin dự án trước khi chuyển sang giai đoạn triển khai
		FormAM(); // Gọi hàm lấy dữ liệu cần thiết cho form báo cáo đầu ra
		_mvShare.setViewName("AM/deployment");
		return _mvShare;
	}
	
	// Thực thi chuyển giai đoạn dự án
	@RequestMapping("/createDeployment/{week}_{year}_{id}")
	public String doDeployment(@ModelAttribute("Project") Project project, @PathVariable int week, @PathVariable int year, @PathVariable int id, Model model, HttpSession session) {
		String am_id = (String) session.getAttribute("user_id");
		_projectService.saveDeployment(project, id); // Lưu dự án Triển khai (cột note sẽ chứa "id" của dự án giai đoạn trước)
		_picService.save(project.getId(), am_id); // Insert Acount Manager (người tạo dự án)
		_picService.save(project.getId(), project.getNote()); // Insert PIC được uỷ quyền thực hiện
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		String week_link = "";
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
	}
	
	@RequestMapping(value = { "/createDeployment_test/{week}_{year}_{id}" }, method = RequestMethod.POST)
	public String doDeployment(BindingResult bindingResult, @ModelAttribute("Project") Project project, @PathVariable int week, @PathVariable int year, @PathVariable int id, Model model, HttpSession session) {
		for( FieldError fieldError : bindingResult.getFieldErrors() ) {
		    System.out.println(fieldError.getField() +" : "+fieldError.getDefaultMessage());
		}
		
		return "redirect:/AM/dashboard/";
	}
	
}
