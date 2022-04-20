package vn.ansv.Dto.Menu;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuPicDtoMapper implements RowMapper<MenuPicDto> {

	public MenuPicDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		MenuPicDto pic = new MenuPicDto();
		
		pic.setPic_id(rs.getString("pic_id"));
		pic.setDisplay_name(rs.getString("display_name"));
		pic.setLevel(rs.getInt("level"));
		pic.setNumber(rs.getInt("number"));
		
		return pic;
	}

}
