package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DashboardProjectPicDtoMapper implements RowMapper<DashboardProjectPicDto> {

	public DashboardProjectPicDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		DashboardProjectPicDto project = new DashboardProjectPicDto();
		
		project.setId_pk(rs.getInt("id_pk"));
		project.setPriority(rs.getString("priority"));
		project.setStatus(rs.getNString("status"));
		project.setName(rs.getNString("name"));
		project.setCustomer(rs.getNString("customer"));
		project.setType(rs.getNString("type"));
		project.setAm(rs.getNString("am"));
		project.setPm(rs.getNString("pm"));
		project.setTinh_trang_va_ke_hoach_chi_tiet(rs.getNString("tinh_trang_va_ke_hoach_chi_tiet"));
		project.setWeek(rs.getInt("week"));
		project.setYear(rs.getInt("year"));
		
		return project;
	}

}
