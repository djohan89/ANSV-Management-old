package vn.ansv.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dto.UsersDto;
import vn.ansv.Dto.Menu.MenuPicDto;

@Service
public interface IUsersService {
	
	@Autowired
	public List<UsersDto> getAllUsers();
	public List<MenuPicDto> getMenu(int week, int year);
	
}
