package vn.ansv.Controller.Chief;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
	@RequestMapping(value = { "/chief/dashboard/{week}_{year}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week, @PathVariable int year) {
		InitCEO(week,year);
		// Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_table",_projectService.getDashboardTable(week,year));
		// Dữ liệu dự án triển khai hiển thị trên Slideshow
		_mvShare.addObject("project_slideshow",_projectService.getSlideshowProject(week,year));
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
}
