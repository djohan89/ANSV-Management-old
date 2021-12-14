package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dto.Menu.MenuCustomersDto;

@Service
public interface ICustomersService {

	@Autowired
	public List<MenuCustomersDto> getAllByWeek(int week);
	
}
