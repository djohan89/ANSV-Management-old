package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UsersDtoMapper implements RowMapper<UsersDto> {

	public UsersDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		UsersDto user = new UsersDto();
		
		user.setId(rs.getString("id"));
		user.setUsername(rs.getString("username"));
		user.setRole(rs.getString("role"));
		user.setDisplay_name(rs.getString("display_name"));
		user.setEnabled(rs.getInt("enabled"));
		user.setCreated_at(rs.getDate("created_at"));
		user.setCreated_by(rs.getString("created_by"));
		
		return user;
	}

}
