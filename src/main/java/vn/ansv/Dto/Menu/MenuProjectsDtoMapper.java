package vn.ansv.Dto.Menu;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuProjectsDtoMapper implements RowMapper<MenuProjectsDto> {

	public MenuProjectsDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		MenuProjectsDto menuProjects = new MenuProjectsDto();
		
		menuProjects.setId(rs.getInt("id"));
		menuProjects.setPic(rs.getString("pic"));
		menuProjects.setName(rs.getString("name"));
		menuProjects.setWeek(rs.getInt("week"));
		
		return menuProjects;
	}

}
