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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Entity.Customer;
import vn.ansv.Entity.Project;

@Controller(value="AM_HomeController")
@RequestMapping("AM")
public class AccountManagerController extends AccountManagerBaseController {

	// Hàm lấy số tuần
	public int getWeekOfYear(Date date) {
		
		Calendar calendar = new GregorianCalendar();
    	calendar.setFirstDayOfWeek(Calendar.MONDAY);
    	// Giới hạn tuần đầu tiên có ít nhất 1 ngày (Trong trường hợp ngày đầu năm là THỨ BẢY hoặc CHỦ NHẬT -> vẫn tính là 1 tuần)
		calendar.setMinimalDaysInFirstWeek(1);
		calendar.setTime(date);
		int week = calendar.get(Calendar.WEEK_OF_YEAR);
		
		return week;
	}
	
	public String getWeekLink(int week) {
		String week_link = "";
		if (week < 10) {
			week_link = "0" + week;
	    }
		return week_link;
	}
	
	@RequestMapping(value = { "/dashboard/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView AmHome(@PathVariable int week, @PathVariable int year, @RequestParam(required = false) String message, HttpSession session, Model model) {
		
		if (message != null && !message.isEmpty()) {
			if (message.equals("update_error")) {
				model.addAttribute("message", "(*) Hiện bạn không thể cập nhật dự án này!");
			}
		}
		
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table_pic",_projectService.getDashboardAM(week, year, pic_id));
		_mvShare.addObject("current_week", current_week);
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
		_mvShare.setViewName("AM/create_project");
		return _mvShare;
	}
	
	// Thực thi insert dự án
	@RequestMapping("/insertProject/{week}_{year}")
	public String doInsertProject(@PathVariable int week, @PathVariable int year, @ModelAttribute("Project") Project project, Model model, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		int project_id = project.getId();
		project.setInteractive("create");
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
		Date now = new Date();   
		int current_week = getWeekOfYear(now) ; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR) ; // Get the curent year
		String week_link = "";
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		
		// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
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
			// Nếu dự án là "TRIỂN KHAI" -> ko cho phép sửa, điều hướng trở lại vào báo lỗi
			ModelAndView modelAndView =  new ModelAndView("redirect:/AM/dashboard/" + getWeekLink(week) + "_" + year);
			modelAndView.addObject("message", "update_error");
			return modelAndView;
		} else {
			Project project = _projectService.getLessById(id, pic_id);
			model.addAttribute("project", project);
		}
		
		_mvShare.setViewName("AM/update");
		return _mvShare;
	}
	
	// Thực thi update dự án
	@RequestMapping("/updateProject/{week}_{year}_{id}")
	public String doUpdateProject(@ModelAttribute("Project") Project project, @PathVariable int week, @PathVariable int year, @PathVariable int id, Model model, HttpSession session) {
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		
		String week_link = "";
		if (week < 10) {
			week_link = "0" + week;
	    }
		
		if (project.getWeek() == current_week) {
			_projectService.update(project);
		} else {
			if (current_week < 10) {
				week_link = "0" + current_week;
		    }
			String pic_id = (String) session.getAttribute("user_id");
			
			_projectService.updateInteractive(project.getId(), "old"); // Cập nhật lại tình trạng bản ghi cũ
			project.setNote(Integer.toString(project.getId()));
			project.setId(_projectService.getMaxId() + 1);
			project.setWeek(current_week);
			project.setInteractive("update");
			_projectService.save(project); // Insert dữ liệu đã cập nhật dưới dạng bản ghi mới
			_picService.save(project.getId(), pic_id); // Insert PIC tương ứng của dự án
			return "redirect:/AM/dashboard/" + week_link + "_" + year; // Sau khi thực hiện insert, điều hướng về thời điểm hiện tại
		}
		
		return "redirect:/AM/dashboard/" + week_link + "_" + year;
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
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		String week_link = "";
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		
		if (week == current_week) {
			project.setId(id);
			System.out.print(project.getId());
			_projectService.update_tk(project); // Sửa lại dự án đã tồn tại trước đó, thay thế cho tuần hiện tại
			_picService.save(project.getId(), project.getNote()); // Insert PIC được uỷ quyền thực hiện
		} else {
			_projectService.saveDeployment(project, id); // Lưu dự án Triển khai (cột note sẽ chứa "id" của dự án giai đoạn trước)
			_picService.save(project.getId(), am_id); // Insert Acount Manager (người tạo dự án)
			_picService.save(project.getId(), project.getNote()); // Insert PIC được uỷ quyền thực hiện
		}
		
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
	}
	
	// Trang danh sách khách hàng
	@RequestMapping(value = { "/customer/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView customerAM(@PathVariable int week, @PathVariable int year, Model model, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitAM(week, year, pic_id);
		// Danh sách khách hàng
		model.addAttribute("customer_form", new Customer());
		_mvShare.addObject("customer", _customersService.getAll());
		_mvShare.setViewName("AM/customer_list"); 
		return _mvShare; 
	}
	
	// Thực thi insert khách hàng
	@RequestMapping("/insertCustomer/{week}_{year}")
	public String doInsertCustomer(@PathVariable int week, @PathVariable int year, @ModelAttribute("customer_form") Customer customer, Model model, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		customer.setCreated_by(pic_id); // Trả mã người tạo
		_customersService.save(customer); // Thực hiện thêm khách hàng
		String week_link = "";
		if (week < 10) {
			week_link = "0" + week;
		}
		
		return "redirect:/AM/customer/" + week_link + "_" + year;
	}
	
	@RequestMapping("/home/{week}_{year}")
	public String home(@PathVariable int week, @PathVariable int year) {
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now) -1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR) ; // Get the curent year
		String week_link = "";
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
	}
	
}
