package vn.ansv.Controller.Chief;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
	@RequestMapping(value = { "/chief/dashboard/{data_id}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable String data_id) {
		String data_week = data_id.substring(0,2); // Lấy ra 2 ký tự đầu từ dữ liệu truyền vào (tuần)
		String data_year = data_id.substring(2); // Lấy ra những ký tự còn lại từ dữ liệu truyền vào (năm)
		// Chuyển chuỗi con thành kiểu Int
		int week = Integer.parseInt(data_week);
		int year = Integer.parseInt(data_year);
		System.out.println("Data week: " + week);
		System.out.println("Data year: " + year);
		
		InitCEO(week);
		_mvShare.addObject("project_table",_projectService.getDashboardTableByWeek(week)); // Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.addObject("project_slideshow",_projectService.getSlideshowProject(week)); // Dữ liệu dự án triển khai hiển thị trên Slideshow
		
		_mvShare.setViewName("chief/chief_dashboard");
		
		return _mvShare;
	}

	@RequestMapping(value = { "/chief/customer_detail/{week}/{type}/{customer}" }, method = RequestMethod.GET)
	public ModelAndView chiefCustomer(@PathVariable int week, @PathVariable int customer, @PathVariable int type) {
		
		InitCEO(week);
		_mvShare.addObject("customer",_projectService.getAllProjectByCustomerAndWeek(week, customer, type));
		_mvShare.setViewName("chief/customer_detail");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "/chief/detail/{week}/{id}" }, method = RequestMethod.GET)
	public ModelAndView chiefDetail(@PathVariable int week, @PathVariable  int id) {
		
		
		InitCEO(week);
		_mvShare.addObject("detail",_projectService.getAllDetailById(week,id));
		_mvShare.setViewName("chief/detail");
		
		return _mvShare;
	}
}
