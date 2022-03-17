package vn.ansv.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.PicDao;
import vn.ansv.Dao.UsersDao;
import vn.ansv.Dto.UsersDto;
import vn.ansv.Dto.Menu.MenuPicDto;

@Service
public class UsersServiceImpl implements IUsersService {
	
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private PicDao picDao;

	public List<UsersDto> getAllUsers() {
		return usersDao.getAllUsers();
	}
	
	public UsersDto getByUser(String username) {
		return usersDao.getByUser(username);
	}
	
	public int getCountUsersRole(String username){
		return usersDao.getCountUsersRole(username);
	}
	
	public int checkUsersRoleExist(String username, String role){
		return usersDao.checkUsersRoleExist(username, role);
	}

	public List<MenuPicDto> getMenu(int week, int year) {
		return usersDao.getMenu(week,year);
	}

	public List<MenuPicDto> getAllPicForm() {
		return picDao.getAllPicForm();
	}
	

}
