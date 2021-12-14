package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.CustomersDao;
import vn.ansv.Dto.Menu.MenuCustomersDto;

@Service
public class CustomersServiceImpl implements ICustomersService {

	@Autowired
	private CustomersDao customersDao;
	
	public List<MenuCustomersDto> getAllByWeek(int week) {
		return customersDao.getAllByWeek(week);
	}

}
