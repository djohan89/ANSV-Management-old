package vn.ansv.Controller.Chief;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "Chief_HomeController")
public class ChiefController extends ChiefBaseController {
	
	@RequestMapping(value = { "/chief/dashboard/{week}" }, method = RequestMethod.GET)
	public ModelAndView chiefHome(@PathVariable int week) {
		
		InitCEO(week);
		_mvShare.setViewName("chief/chief_dashboard");
		
		return _mvShare;
	}

}
