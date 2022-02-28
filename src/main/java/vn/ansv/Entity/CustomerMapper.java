package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CustomerMapper implements RowMapper<Customer> {

	public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
		Customer customer = new Customer();
		
		customer.setId(rs.getInt("id"));
		customer.setName(rs.getString("name"));
		customer.setCreated_by(rs.getString("created_by"));
		customer.setDisplay_name(rs.getString("display_name"));
		customer.setCreated_at(rs.getDate("created_at"));
		
		return customer;
	}

}
