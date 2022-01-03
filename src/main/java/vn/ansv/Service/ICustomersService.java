package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dto.Menu.MenuCustomersDto;
import vn.ansv.Entity.Customer;

@Service
public interface ICustomersService {

	@Autowired
	public List<MenuCustomersDto> getMenu(int week, int year);
	public List<Customer> getAllCustomerForm();
	
}
