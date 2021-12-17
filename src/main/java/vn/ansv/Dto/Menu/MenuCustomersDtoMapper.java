package vn.ansv.Dto.Menu;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuCustomersDtoMapper implements RowMapper<MenuCustomersDto> {

	public MenuCustomersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		MenuCustomersDto customersDto = new MenuCustomersDto();
		
		customersDto.setProject_id(rs.getInt("project_id"));
		customersDto.setCustomer_id(rs.getInt("customer_id"));
		customersDto.setProject_type(rs.getString("project_type"));
		customersDto.setCustomer(rs.getString("customer"));
		customersDto.setNumber(rs.getInt("number"));
		customersDto.setWeek(rs.getInt("week"));
		
		return customersDto;
	}
	
}
