package vn.ansv.Controller.PM;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Entity.Priority;
import vn.ansv.Entity.Project;

@Controller(value = "PM_HomeController")
@RequestMapping("PM")
public class ProjectManagerController extends ProjectManagerBaseController {

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
	public ModelAndView PmHome(@PathVariable int week, @PathVariable int year, HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitPM(week, year, pic_id);
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table_pic", _projectService.getDashboardTableByPIC(week, year, pic_id));
		_mvShare.setViewName("PM/pm_dashboard");
		return _mvShare;
	}

	@RequestMapping(value = { "/detail/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView PmDetail(@PathVariable int week, @PathVariable int year, @PathVariable int id,
			HttpSession session) {
		String pic_id = (String) session.getAttribute("user_id");
		InitPM(week, year, pic_id);
		_mvShare.addObject("detail", _projectService.getByIdAndPic(id, pic_id));
		_mvShare.setViewName("PM/detail");
		return _mvShare;
	}
	
	// Thực thi xoá dự án
		@RequestMapping("/delete_project/{week}_{year}_{id}")
		public String doDeleteProject(@PathVariable int week, @PathVariable int year, @PathVariable int id) {
			_picService.delete(id);
			_projectService.delete(id);
			Date now = new Date();   
			int current_week = getWeekOfYear(now) -1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
			int current_year = Calendar.getInstance().get(Calendar.YEAR) - 1; // Get the curent year
			String week_link = "";
			if (current_week < 10) {
				week_link = "0" + current_week;
		    }
			
			// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
			return "redirect:/PM/dashboard/" + week_link  + "_" + current_year ;
		}

	// Link đến form update dự án
	@RequestMapping(value = { "/update_project/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView PmUpdateProject(@PathVariable int week, @PathVariable int year, @PathVariable int id,
			HttpSession session, Model model) {
		String pic_id = (String) session.getAttribute("user_id");
		FormPM();
		Project project = _projectService.getMorebyId(id, pic_id);
		model.addAttribute("project", project);

		_mvShare.setViewName("PM/update");
		return _mvShare;
	}

	@RequestMapping("/updateProjectPM/{week}_{year}_{id}")
	public String doUpdateProject(@ModelAttribute("Project") Project project, @PathVariable int week,
			@PathVariable int year, @PathVariable int id, Model model) {
		_projectService.update_tk(project);
		Date now = new Date();   
		int current_week = getWeekOfYear(now) -1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR) ; // Get the curent year
		String week_link = "";
		if (current_week < 10) {
			week_link = "0" + current_week;
	    }
		return "redirect:/PM/dashboard/" + week_link + "_" + current_year;
	}


}
