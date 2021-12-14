package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectDtoMapper implements RowMapper<ProjectDto> {

	public ProjectDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ProjectDto project = new ProjectDto();
		
		project.setId(rs.getInt("id"));
		project.setPic(rs.getString("pic"));
		project.setProject_type(rs.getString("project_type"));
		project.setPriority(rs.getString("priority"));
		project.setProject_status(rs.getString("project_status"));
		project.setCustomer(rs.getString("customer"));
		project.setProject_id(rs.getString("project_id"));
		project.setProject_name(rs.getString("project_name"));
		project.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		project.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		project.setWeek(rs.getInt("week"));
		
		return project;
	}

}
