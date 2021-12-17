package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class SlideshowProjectsDtoMapper implements RowMapper<SlideshowProjectsDto> {

	public SlideshowProjectsDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		SlideshowProjectsDto dashboardProjects = new SlideshowProjectsDto();
		
		dashboardProjects.setId_pk(rs.getInt("id_pk"));
		dashboardProjects.setWeek(rs.getInt("week"));
		dashboardProjects.setPriority(rs.getString("priority"));
		dashboardProjects.setStatus(rs.getString("status"));
		dashboardProjects.setName(rs.getString("name"));
		
		dashboardProjects.setCustomer(rs.getString("customer"));
		dashboardProjects.setPm(rs.getString("pm"));
		dashboardProjects.setAm(rs.getString("am"));
		dashboardProjects.setPham_vi_cung_cap(rs.getString("pham_vi_cung_cap"));
		dashboardProjects.setTong_gia_tri_thuc_te(rs.getDouble("tong_gia_tri_thuc_te"));
		
		dashboardProjects.setDAC(rs.getDate("DAC"));
		dashboardProjects.setPAC(rs.getDate("PAC"));
		dashboardProjects.setFAC(rs.getDate("FAC"));
		dashboardProjects.setSo_tien_tam_ung(rs.getDouble("so_tien_tam_ung"));
		dashboardProjects.setKe_hoach_tam_ung(rs.getDate("ke_hoach_tam_ung"));
		
		dashboardProjects.setSo_tien_DAC(rs.getDouble("so_tien_DAC"));
		dashboardProjects.setKe_hoach_thanh_toan_DAC(rs.getDate("ke_hoach_thanh_toan_DAC"));
		dashboardProjects.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		dashboardProjects.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		dashboardProjects.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		dashboardProjects.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		
		dashboardProjects.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		dashboardProjects.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		
		return dashboardProjects;
	}

}
