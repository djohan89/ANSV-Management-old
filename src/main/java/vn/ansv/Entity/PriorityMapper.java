package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PriorityMapper implements RowMapper<Priority> {

	public Priority mapRow(ResultSet rs, int rowNum) throws SQLException {
		Priority priority = new Priority();
		priority.setId(rs.getInt("id"));
		priority.setName(rs.getString("name"));
		return priority;
	}

}
