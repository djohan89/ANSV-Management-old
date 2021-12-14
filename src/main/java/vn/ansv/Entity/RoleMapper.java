package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoleMapper implements RowMapper<Role> {

	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {

		Role role = new Role();
		
		role.setId(rs.getInt("id"));
		role.setName(rs.getString("name"));
		
		return role;
	}

}
