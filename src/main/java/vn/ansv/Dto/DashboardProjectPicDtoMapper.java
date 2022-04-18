package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DashboardProjectPicDtoMapper implements RowMapper<DashboardProjectPicDto> {

	public DashboardProjectPicDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		DashboardProjectPicDto project = new DashboardProjectPicDto();
		
		project.setId_pk(rs.getInt("id_pk"));
		project.setPriority(rs.getString("priority"));
		project.setStatus(rs.getString("status"));
		project.setName(rs.getString("name"));
		project.setCustomer(rs.getString("customer"));
		project.setType(rs.getString("type"));
		project.setAm(rs.getString("am"));
		project.setPm(rs.getString("pm"));
		project.setKe_hoach(rs.getString("ke_hoach"));
		project.setWeek(rs.getInt("week"));
		project.setYear(rs.getInt("year"));
		project.setNote(rs.getString("note"));
		
		return project;
	}

}
