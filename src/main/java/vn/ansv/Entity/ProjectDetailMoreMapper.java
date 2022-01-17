package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectDetailMoreMapper implements RowMapper<Project> {

	public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
		Project Project = new Project();
		
		Project.setId(rs.getInt("id"));
		Project.setProject_type(rs.getInt("project_type"));
		Project.setPriority(rs.getInt("priority"));
		Project.setProject_status(rs.getInt("project_status"));
		Project.setCustomer(rs.getInt("customer"));
		
		Project.setWeek(rs.getInt("week"));
		Project.setYear(rs.getInt("year"));
		Project.setName(rs.getString("name"));
		Project.setProject_id(rs.getString("project_id"));
		Project.setMa_so_ke_toan(rs.getString("ma_so_ke_toan"));
		
		Project.setPham_vi_cung_cap(rs.getString("pham_vi_cung_cap"));
		Project.setTong_gia_tri_thuc_te(rs.getDouble("tong_gia_tri_thuc_te"));
		Project.setDAC(rs.getDate("DAC"));
		Project.setPAC(rs.getDate("PAC"));
		Project.setFAC(rs.getDate("FAC"));
		
		Project.setSo_tien_tam_ung(rs.getDouble("so_tien_tam_ung"));
		Project.setKe_hoach_tam_ung(rs.getDate("ke_hoach_tam_ung"));
		Project.setSo_tien_DAC(rs.getDouble("so_tien_DAC"));
		Project.setKe_hoach_thanh_toan_DAC(rs.getDate("ke_hoach_thanh_toan_DAC"));
		Project.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		
		Project.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		Project.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		Project.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		Project.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		Project.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		
		return Project;
	}

}
