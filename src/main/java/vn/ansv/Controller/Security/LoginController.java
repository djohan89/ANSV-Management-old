package vn.ansv.Controller.Security;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;

import javax.naming.AuthenticationException;
import javax.naming.AuthenticationNotSupportedException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.ansv.Entity.Users;
import vn.ansv.Service.RoleServiceImpl;
import vn.ansv.Service.User.UsersServiceImpl;

@Controller
public class LoginController {
	
	@Autowired
	UsersServiceImpl usersService;
	
	@Autowired
	RoleServiceImpl roleService;
	
	// Hàm check tài khoản login tương ứng trên LDAP
	public String ldapAuthentication(String username, String password) {
		String result = "1";
		
		String url = "ldap://172.24.104.6:389";
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, url);
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, username);
		env.put(Context.SECURITY_CREDENTIALS, password);

		try {
			DirContext ctx = new InitialDirContext(env);
			System.out.println("Connected");
			System.out.println(ctx.getEnvironment());
			
			// do something useful with the context...

			ctx.close();

		} catch (AuthenticationNotSupportedException ex) {
			System.out.println("The authentication is not supported by the server");
			result = "0";
		} catch (AuthenticationException ex) {
			System.out.println("incorrect password or username");
			result = "0";
		} catch (NamingException ex) {
			System.out.println("error when trying to create the context");
			result = "0";
		}
		return result;
	}
	
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
			if (message.equals("session_error")) {
				model.addAttribute("message", "(*) Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
			}
		}
		return "security/login";
	}
	
	
	
	@RequestMapping(value = "/login_process", method = RequestMethod.GET)
	public @ResponseBody String loginProcess(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password_main");
		
		System.out.println("User: " + username + " - Pass: " + password);
		
		// Trả về giá trị của hàm check LDAP
		return ldapAuthentication(username, password);
	}
	
	@RequestMapping(value = "/compare_role_user", method = RequestMethod.POST)
	public @ResponseBody String compareRole(HttpServletRequest request) {
		String[] role_accept = {"ROLE_ADMIN", "ROLE_CEO", "ROLE_AM", "ROLE_PM", "ROLE_MEMBER"};
		
		String result = "0";
		String username = request.getParameter("username");
		String role = "";
		String size_role = request.getParameter("size_role");
		String display_name = request.getParameter("display_name");
		int check = 0;
		int check_status = 0;
		
		/* int check = usersService.checkUsersRoleExist(username, role); */
		
		for (int i = 1; i <= Integer.parseInt(size_role); i++) {
			role = request.getParameter("role"+i);
			// Vòng lặp kiểm tra role lớn nhất user có, so sánh với role được cấp trên database => Nếu khác, thực hiện update role mới trên database
			for (int j = 0; j < 5; j++) {
			    if (role.equals(role_accept[j]) == true && check_status == 0) {
			    	check++;
			    	check_status++;
			    	System.out.println("OK  for j - 0");
			    	
			    	// Kiểm tra user trên database
			    	if (usersService.checkUserExist(username) == 1) {
			    		System.out.println("OK  for j - 1");
			    		// Nếu đã tồn tại => So sánh role của user đó
			    		if (usersService.checkUsersRoleExist(username, role) != 1) {
			    			// Nếu khác => Thực hiện update role mới
			    			usersService.updateRoleByUser(username, role);
						}
			    	} else {
			    		System.out.println("OK  for j - 2");
			    		// Nếu chưa tồn tại => Tạo mới user và role cho user đó
			    		Users data_user_insert = new Users();
			    		data_user_insert.setId(String.valueOf(usersService.count() + 1));
			    		data_user_insert.setUsername(username);
			    		data_user_insert.setPassword("{noop}");
			    		data_user_insert.setDisplay_name(display_name);
			    		data_user_insert.setEnabled(1);
			    		data_user_insert.setCreated_by("System");
			    		
			    		usersService.save(data_user_insert); // Lưu user
			    		usersService.saveRoleForUser(username, role); // Cấp role cho user
			    	}
			    }
			}
		}
		
		if (check != 0) {
			result = "1";
		}
		
		return result;
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
		int the_week_before = 0;
		
		Date trialTime = new Date();   
		int current_week = getWeekOfYear(trialTime); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
		int year = Calendar.getInstance().get(Calendar.YEAR); // Get the curent year
    	System.out.println("The current year: " + year);
		
		// Kiểm tra tuần hiện tại => lấy ra tuần trước đó
		if (current_week == 1) {
			//Nếu tuần hiện tại lấy được là tuần đầu tiên của năm nay (tuần 1) => "Tuần trước" sẽ là tuần cuối cùng của năm trước
			Calendar cal = Calendar.getInstance();
			cal.setTime(trialTime);
			cal.add(Calendar.DATE, -7);
			Date dateBefore7Days = cal.getTime();
			System.out.println("abc: " + dateBefore7Days);
			the_week_before = getWeekOfYear(dateBefore7Days); // Gọi hàm lấy số tuần => Lấy số tuần hiện tại
			year = year - 1;
		} else {
			the_week_before = current_week - 1; // Nếu ko phải thì chỉ cần trừ đi 1 => "Tuần trước"
		}
		System.out.println("The week before: " + the_week_before);
		System.out.println("The current week: " + current_week);
    	System.out.println("The current date: " + trialTime);

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
		    
		    String the_week_before_format = String.valueOf(the_week_before);
		    
		    if (the_week_before < 10) {
		    	the_week_before_format = "0" + the_week_before_format;
		    }
		    
		    
		    // Check user's role and then redirect
		    if (request.isUserInRole("ROLE_ADMIN")) {
		    	session.setAttribute("role", "Admin");
		    	return "redirect:/admin/dashboard";
		    }
			if (request.isUserInRole("ROLE_CEO")) {
				session.setAttribute("role", "chief");
		    	return "redirect:/chief/dashboard/" + the_week_before_format + "_" + year;
		    }
			if (request.isUserInRole("ROLE_AM")) {
				session.setAttribute("role", "AM");
		    	return "redirect:/AM/dashboard/" + the_week_before_format + "_" + year;
		    }
			if (request.isUserInRole("ROLE_PM")) {
				session.setAttribute("role", "PM");
		    	return "redirect:/PM/dashboard/" + the_week_before_format + "_" + year;
		    }
			// End: Check user's role and then redirect
		
		}
	    
		session.setAttribute("role", "user");
		return "redirect:/user/dashboard/"+the_week_before + "_" + year;
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
