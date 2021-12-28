package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CustomersDtoMapper implements RowMapper<CustomersDto> {

	public CustomersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		CustomersDto customer = new CustomersDto();
		
		customer.setId(rs.getInt("id"));
		customer.setName(rs.getString("name"));
		customer.setCreated_by(rs.getString("created_by"));
		customer.setCreated_at(rs.getDate("created_at"));
		
		return customer;
	}

}
