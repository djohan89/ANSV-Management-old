package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectTypesMapper implements RowMapper<ProjectTypes> {

	public ProjectTypes mapRow(ResultSet rs, int rowNum) throws SQLException {

		ProjectTypes types = new ProjectTypes();
		
		types.setId(rs.getInt("id"));
		types.setName(rs.getString("name"));
		types.setDisplay(rs.getString("display"));
		types.setNumber(rs.getInt("number"));
		
		return types;
	}

}
