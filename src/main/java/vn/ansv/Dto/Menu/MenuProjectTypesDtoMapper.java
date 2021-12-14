package vn.ansv.Dto.Menu;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuProjectTypesDtoMapper implements RowMapper<MenuProjectTypesDto> {

	public MenuProjectTypesDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		MenuProjectTypesDto types = new MenuProjectTypesDto();
		
		types.setId(rs.getInt("id"));
		types.setName(rs.getString("name"));
		types.setNumber(rs.getInt("number"));
		
		return types;
	}

}
