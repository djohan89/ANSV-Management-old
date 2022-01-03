package vn.ansv.Controller.User;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "User_HomeController")
public class HomeController extends UserBaseController {
	
	@RequestMapping(value = { "/user/dashboard/{week}" }, method = RequestMethod.GET)
	public ModelAndView memberHome(@PathVariable int week,HttpSession session) {
		
		
		InitUser(week);
		String pic_id = (String) session.getAttribute("user_id");
		_mvShare.addObject("project_table_pic",_projectService.getDashboardTableByPIC(week,pic_id )); // Dữ liệu khái quát hiển thị lên dashboard (datatable)
		_mvShare.setViewName("user/user_dashboard");
		
		return _mvShare;
	}
	
	@RequestMapping(value = { "user/detail/{week}/{id}" }, method = RequestMethod.GET)
	public ModelAndView memberDetail(@PathVariable int week, @PathVariable  int id) {
		
		InitUser(week);
		_mvShare.addObject("detail",_projectService.getById(id));
		_mvShare.setViewName("user/detail");
		
		return _mvShare;
	}

	
}
