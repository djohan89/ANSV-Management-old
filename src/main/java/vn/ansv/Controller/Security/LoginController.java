package vn.ansv.Controller.Security;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.ansv.Service.RoleServiceImpl;
import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class LoginController {
	
	@Autowired
	UsersServiceImpl usersService;
	
	@Autowired
	RoleServiceImpl roleService;
	
	@RequestMapping("/login")
	public String login(@RequestParam(required = false) String message, final Model model) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
				model.addAttribute("message", "Đăng xuất thành công!");
			}
			if (message.equals("account_error")) {
				model.addAttribute("message", "(*) Tên đăng nhập hoặc mật khẩu không chính xác!");
			}
			if (message.equals("authorization_error")) {
				model.addAttribute("message", "(*) Không đủ quyền truy cập.");
			}
		}
		return "security/login";
	}
	
	@RequestMapping("/login_success_test")
	public String loginSuccessTest(HttpSession session, Model model, Principal principal) {
		String loggedInUserName = principal.getName();
		session.setAttribute("username", loggedInUserName);
		
		System.out.println("Username: " + loggedInUserName);
		
		return "redirect:/user/dashboard";
	}
	
	@RequestMapping("/login_success")
	public String loginSuccess(HttpServletRequest request, HttpSession session, Model model, Authentication authentication) {
		String userName = "- (*)Chưa đăng nhập!"; // Any default user  name

		if (authentication != null) {
	    	UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    	
	    	userName = userDetails.getUsername();
	    	//int role_quantity = userDetails.getAuthorities().size(); // Lấy ra số lương quyền của tài khoản hiện tại
	    	
	    	System.out.println("User has authorities: " + userDetails.getAuthorities());
		    System.out.println("Username: " + userDetails.getUsername());
		    System.out.println("Account: " + userDetails);
		    
		    System.out.println("Display name: " + usersService.getByUser(userName).getDisplay_name());
		    
		    session.setAttribute("username", userDetails.getUsername());
		    session.setAttribute("display_name", usersService.getByUser(userName).getDisplay_name());
		    session.setAttribute("user_id", usersService.getByUser(userName).getId());
		    
		    
		    
		    // Check user's role and then redirect
		    if (request.isUserInRole("ROLE_ADMIN")) {
		    	session.setAttribute("role", "Admin");
		    	return "redirect:/admin/dashboard";
		    }
			if (request.isUserInRole("ROLE_CEO")) {
				Calendar calendar = new GregorianCalendar();
		    	Date trialTime = new Date();   
		    	calendar.setTime(trialTime);     
		    	int week = calendar.get(Calendar.WEEK_OF_YEAR); // Get the curent week number
		    	int the_week_before = week - 1; // Get the week number before
		    	System.out.println("Week number:" + 
		    	    calendar.get(Calendar.WEEK_OF_YEAR));
		    	System.out.println("Date: " + trialTime);
		    	
		    	// The second user's role
		    	session.setAttribute("role", "CEO");
		    	return "redirect:/chief/dashboard/"+the_week_before;
		    }
			if (request.isUserInRole("ROLE_AM")) {
				Calendar calendar = new GregorianCalendar();
		    	Date trialTime = new Date();   
		    	calendar.setTime(trialTime);     
		    	int week = calendar.get(Calendar.WEEK_OF_YEAR); // Get the curent week number
		    	int the_week_before = week - 1; // Get the week number before
		    	// The second user's role
		    	session.setAttribute("role", "AM");
		    	return "redirect:/AM/dashboard/"+the_week_before;
		    }
			if (request.isUserInRole("ROLE_PM")) {
				// The third user's role
		    	session.setAttribute("role", "PM");
		    	return "redirect:/PM/dashboard";
		    }
			// End: Check user's role and then redirect
		
		}
	    
		session.setAttribute("role", "User");
		return "redirect:/user/dashboard";
	}
	
	@RequestMapping("/access_denied")
	public String loginError(@RequestParam(required = false) String message, final Model model) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("authorization_error")) {
				model.addAttribute("message", "(*) Không đủ quyền hạn để truy cập!");
			}
		}
		return "security/access_denied";
	}
	
//	@RequestMapping("/login_admin")
//	public String login1(@RequestParam(required = false) String message, final Model model) {
//		if (message != null && !message.isEmpty()) {
//			if (message.equals("logout")) {
//				model.addAttribute("message", "Đăng xuất thành công!");
//			}
//			if (message.equals("error")) {
//				model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
//			}
//		}
//		return "security/login_admin";
//	}
//
//	@RequestMapping("/login_user")
//	public String login2(@RequestParam(required = false) String message, final Model model) {
//		if (message != null && !message.isEmpty()) {
//			if (message.equals("logout")) {
//				model.addAttribute("message", "Đăng xuất thành công!");
//			}
//			if (message.equals("error")) {
//				model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
//			}
//		}
//		return "security/login_member";
//	}
	
	

}
