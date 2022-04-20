package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DashboardProjectDtoMapper implements RowMapper<DashboardProjectDto> {

	public DashboardProjectDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		DashboardProjectDto project = new DashboardProjectDto();
		
		project.setId(rs.getInt("id"));
		project.setId_user(rs.getString("id_user"));
		project.setPic(rs.getString("pic"));
		project.setPic_role(rs.getString("pic_role"));
		project.setType(rs.getString("type"));
		project.setPriority(rs.getString("priority"));
		project.setStatus(rs.getString("status"));
		project.setCustomer(rs.getString("customer"));
		project.setProject_name(rs.getString("project_name"));
		project.setKe_hoach(rs.getString("ke_hoach"));
		project.setWeek(rs.getInt("week"));
		
		return project;
	}

}
