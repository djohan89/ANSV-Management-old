package vn.ansv.Controller.Chief;

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

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
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
	
	@RequestMapping(value = { "/chief/dashboard/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week, @PathVariable int year) {
		InitCEO(week,year);
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table",_projectService.getDashboardTable(week,year));
		// Dữ liệu dự án triển khai hiển thị trên Slideshow
		_mvShare.addObject("project_slideshow",_projectService.getSlideshowProject(week,year));
		_mvShare.addObject("current_week", current_week);
		_mvShare.setViewName("chief/chief_dashboard");
		
		return _mvShare;
	}

	@RequestMapping(value = { "/chief/customer_detail/{week}_{year}_{type}_{customer}" }, method = RequestMethod.GET)
	public ModelAndView chiefCustomer(@PathVariable int week, @PathVariable int year, @PathVariable int customer, @PathVariable int type) {
		
		InitCEO(week,year);
		_mvShare.addObject("customer",_projectService.getAllProjectByCustomer(week, year, customer, type));
		_mvShare.setViewName("chief/customer_detail");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/chief/detail/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefDetail(@PathVariable int week, @PathVariable int year, @PathVariable int id) {
		
		InitCEO(week,year);
		_mvShare.addObject("detail",_projectService.getById(id));
		_mvShare.setViewName("chief/detail");
		
		return _mvShare;
	}
	
	@RequestMapping("chief/delete_project/{week}_{year}_{id}")
	public String doDeleteCustomer(@PathVariable int week, @PathVariable int year, @PathVariable int id) {
		_picService.delete(id);
		_projectService.delete(id);
		
		// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
		return "redirect:/chief/dashboard/" + week + "_" + year;
	}
	@RequestMapping("/chief/home/{week}_{year}")
	public String home(@PathVariable int week, @PathVariable int year) {
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now) -1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR) ; // Get the curent year
		String week_link = Integer.toString(current_week);
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		return "redirect:/chief/dashboard/" + week_link + "_" + current_year;
	}
	
	// Link đến form update dự án triển khai 
	@RequestMapping(value = { "/chief/update_project_tk/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView CeoUpdateProject_tk(@PathVariable int week, @PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
	FormCEO();
	Project project = _projectService.getProjectTkById(id);
	model.addAttribute("project", project);
		
		
	_mvShare.setViewName("chief/update_tk");
	return _mvShare;
	
	}
		
	//Thực thi update dự án triển khai
	@RequestMapping("chief/updateProjectTkCEO/{week}_{year}_{id}")
	public String CeoDoUpdateProject1(@ModelAttribute("Project") Project project, @PathVariable int week,
			@PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		
		String week_link = Integer.toString(week);
		if (week < 10) {
			week_link = "0" + week;
	    }
		_projectService.update_tk(project);
		return "redirect:/chief/dashboard/" + week_link + "_" + year;
		
	}
		
	// Link đến form update dự án viễn thông và chuyển đổi số
	@RequestMapping(value = { "/chief/update_project/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView CeoUpdateProject(@PathVariable int week, @PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		FormCEO();
		Project project = _projectService.getProjectById(id);
		model.addAttribute("project", project);
			
			
		_mvShare.setViewName("chief/update");
		return _mvShare;
		
		}
	//Thực thi update dự án viễn thông và chuyển đổi số
	@RequestMapping("chief/updateProjectCEO/{week}_{year}_{id}")
	public String CeoDoUpdateProject(@ModelAttribute("Project") Project project, @PathVariable int week,
			@PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		Date now = new Date();   
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		
		String week_link = Integer.toString(week);
		if (week < 10) {
			week_link = "0" + week;
	    }
		_projectService.update(project);
		return "redirect:/chief/dashboard/" + week_link + "_" + year;
		
	}
	
	@RequestMapping("/home/{week}_{year}")
	public String home1(@PathVariable int week, @PathVariable int year) {
		
		Date now = new Date();   
		int current_week = getWeekOfYear(now) -1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR) ; // Get the curent year
		String week_link = Integer.toString(current_week);
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
	}
		
}
