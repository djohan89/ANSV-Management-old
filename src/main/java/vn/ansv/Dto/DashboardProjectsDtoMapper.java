package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DashboardProjectsDtoMapper implements RowMapper<DashboardProjectsDto> {

	public DashboardProjectsDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		DashboardProjectsDto dashboardProjects = new DashboardProjectsDto();
		
		dashboardProjects.setId(rs.getInt("id"));
		dashboardProjects.setWeek(rs.getInt("week"));
		dashboardProjects.setType(rs.getString("type"));
		dashboardProjects.setPriority(rs.getString("priority"));
		dashboardProjects.setStatus(rs.getString("status"));
		dashboardProjects.setName(rs.getString("name"));
		dashboardProjects.setCustomer(rs.getString("customer"));
		dashboardProjects.setPic_id(rs.getString("pic_id"));
		dashboardProjects.setPic_name(rs.getString("pic_name"));
		dashboardProjects.setPic_role(rs.getString("pic_role"));
		dashboardProjects.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		
		return dashboardProjects;
	}

}
