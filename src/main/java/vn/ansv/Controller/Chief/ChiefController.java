package vn.ansv.Controller.Chief;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vn.ansv.Entity.Project;

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
	@RequestMapping(value = "/chief/export_data/{week}_{type}", method = RequestMethod.GET)
	@ResponseBody
	public String exportData(@PathVariable int week, @PathVariable int type){
		return _importServiceImpl.exportProject(week, type);
	}
	
	@RequestMapping(value = "/chief/upload_project", method = RequestMethod.POST)
	public String processExcel2003(Model model, HttpServletRequest request) throws IOException {
		String file_name = request.getParameter("file_import_name");
		Date now = new Date();
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		
		// Thực hiện import
		_importServiceImpl.importProject(file_name, current_week);
		_importServiceImpl.exportProject(19, 1);

		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		return "redirect:/chief/dashboard/" + current_week + "_" + current_year;
	}

	// Hàm lấy số tuần
	public int getWeekOfYear(Date date) {

		Calendar calendar = new GregorianCalendar();
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		// Giới hạn tuần đầu tiên có ít nhất 1 ngày (Trong trường hợp ngày đầu năm là
		// THỨ BẢY hoặc CHỦ NHẬT -> vẫn tính là 1 tuần)
		calendar.setMinimalDaysInFirstWeek(1);
		calendar.setTime(date);
		int week = calendar.get(Calendar.WEEK_OF_YEAR);

		return week;
	}

	@RequestMapping(value = { "/chief/dashboard/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week, @PathVariable int year, HttpSession session) {
		session.setAttribute("week_option", week);
		session.setAttribute("year_option", year);

		InitCEO(week, year);
		Date now = new Date();
		// Calendar now_1 = Calendar.getInstance();
		// TimeZone timeZone = now_1.getTimeZone();
		// _mvShare.addObject("date_now", timeZone);
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table", _projectService.getDashboardTable(week, year));
		// Dữ liệu dự án triển khai hiển thị trên Slideshow
		_mvShare.addObject("project_slideshow", _projectService.getSlideshowProject(week, year));
		_mvShare.addObject("current_week", current_week);
		_mvShare.setViewName("chief/chief_dashboard");

		return _mvShare;
	}

	@RequestMapping(value = { "/chief/customer_detail/{week}_{year}_{type}_{customer}" }, method = RequestMethod.GET)
	public ModelAndView chiefCustomer(@PathVariable int week, @PathVariable int year, @PathVariable int customer,
			@PathVariable int type) {

		InitCEO(week, year);
		_mvShare.addObject("customer", _projectService.getAllProjectByCustomer(week, year, customer, type));
		_mvShare.setViewName("chief/customer_detail");

		return _mvShare;
	}

	@RequestMapping(value = { "/chief/detail/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefDetail(@PathVariable int week, @PathVariable int year, @PathVariable int id) {

		InitCEO(week, year);
		Date now = new Date();
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		_mvShare.addObject("current_week", current_week);
		_mvShare.addObject("project_detail", _projectService.getById(id));
		_mvShare.setViewName("chief/detail");

		return _mvShare;
	}

	@RequestMapping("/chief/delete_project/{week}_{year}_{id}")
	public String doDeleteCustomer(@PathVariable int week, @PathVariable int year, @PathVariable int id) {
		_picService.delete(id);
		_projectService.delete(id);

		// Sau khi insert thành công sẽ điều hướng về tuần chứa báo cáo đó
		return "redirect:/chief/dashboard/" + week + "_" + year;
	}

	@RequestMapping("/chief/home/{week}_{year}")
	public String home(@PathVariable int week, @PathVariable int year) {

		Date now = new Date();
		int current_week = getWeekOfYear(now) - 1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		String week_link = Integer.toString(current_week);
		if (current_week < 10) {
			week_link = "0" + current_week;
		}
		return "redirect:/chief/dashboard/" + week_link + "_" + current_year;
	}

	// Link đến form update dự án triển khai
	@RequestMapping(value = { "/chief/update_project_tk/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView CeoUpdateProject_tk(@PathVariable int id, HttpSession session, Model model) {
		FormCEO();
		Project project_update = new Project();

		project_update = _projectService.getProjectTkById(id);
		model.addAttribute("project_update", project_update);

		_mvShare.setViewName("chief/update_tk");
		return _mvShare;

	}

	// Thực thi update dự án triển khai
	@RequestMapping("chief/updateProjectTkCEO/{week}_{year}_{id}")
	public String CeoDoUpdateProject1(@ModelAttribute("Project") Project project_update, @PathVariable int week,
			@PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		String pic_id = (String) session.getAttribute("user_id");
		Date now = new Date();
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		String week_link = Integer.toString(week);
		if (week < 10) {
			week_link = "0" + week;
		}

		if (_picService.checkPicOfProjectIsset(id, pic_id) != 0 && week != current_week) {
			if (current_week < 10) {
				week_link = "0" + current_week;
			}

			_projectService.updateInteractive(project_update.getId(), "old");
			String am_id = _picService.getPICByProjectId(project_update.getId());
			project_update.setNote(Integer.toString(project_update.getId()));
			project_update.setId(_projectService.getMaxId() + 1);
			project_update.setWeek(current_week);
			project_update.setInteractive("update");

			_projectService.saveDep(project_update);
			_picService.save(project_update.getId(), pic_id);
			_picService.save(project_update.getId(), am_id);
			return "redirect:/chief/dashboard/" + week_link + "_" + year;
		} else {
			_projectService.update_tk(project_update);
		}

		return "redirect:/chief/detail/" + week_link + "_" + year + "_" + id;

	}

	// Link đến form update dự án viễn thông và chuyển đổi số
	@RequestMapping(value = { "/chief/update_project/{week}_{year}_{id}" }, method = RequestMethod.GET)
	public ModelAndView CeoUpdateProject(@PathVariable int week, @PathVariable int year, @PathVariable int id,
			HttpSession session, Model model) {
		FormCEO();
		Project project = _projectService.getProjectById(id);
		model.addAttribute("project", project);

		_mvShare.setViewName("chief/update");
		return _mvShare;

	}

	// Thực thi update dự án viễn thông và chuyển đổi số
	@RequestMapping("chief/updateProjectCEO/{week}_{year}_{id}")
	public String CeoDoUpdateProject(@ModelAttribute("Project") Project project, @PathVariable int week,
			@PathVariable int year, @PathVariable int id, HttpSession session, Model model) {
		String pic_id = (String) session.getAttribute("user_id");
		Date now = new Date();
		int current_week = getWeekOfYear(now); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		String week_link = Integer.toString(week);
		if (week < 10) {
			week_link = "0" + week;
		}

		if (_picService.checkPicOfProjectIsset(id, pic_id) != 0 && week != current_week) {
			if (current_week < 10) {
				week_link = "0" + current_week;
			}

			_projectService.updateInteractive(project.getId(), "old");
			project.setInteractive("create");
			_projectService.save(project); // Insert dữ liệu dự án mới
			_picService.save(project.getId(), pic_id); // Insert PIC tương ứng của dự án
			return "redirect:/chief/dashboard/" + week_link + "_" + year;
		} else {
			_projectService.update(project);
		}

		return "redirect:/chief/detail/" + week_link + "_" + year + "_" + id;

	}

	@RequestMapping("/home/{week}_{year}")
	public String home1(@PathVariable int week, @PathVariable int year) {

		Date now = new Date();
		int current_week = getWeekOfYear(now) - 1; // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int current_year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
		String week_link = Integer.toString(current_week);
		if (current_week < 10) {
			week_link = "0" + current_week;
		}
		return "redirect:/AM/dashboard/" + week_link + "_" + current_year;
	}

}
