package vn.ansv.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectMapper implements RowMapper<Project> {

	public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
		Project project = new Project();
		
		project.setId(rs.getInt("id"));
		project.setProject_type(rs.getInt("project_type"));
		project.setPriority(rs.getInt("priority"));
		project.setProject_status(rs.getInt("project_status"));
		project.setCustomer(rs.getInt("customer"));
		
		project.setWeek(rs.getInt("week"));
		project.setProject_id(rs.getString("project_id"));
		project.setMa_so_ke_toan(rs.getString("ma_so_ke_toan"));
		project.setName(rs.getString("name"));
		project.setDescription(rs.getString("description"));
		
		project.setTong_muc_dau_tu_du_kien(rs.getString("tong_muc_dau_tu_du_kien"));
		project.setHinh_thuc_dau_tu(rs.getString("hinh_thuc_dau_tu"));
		project.setMuc_do_kha_thi(rs.getInt("muc_do_kha_thi"));
		project.setPhan_tich_SWOT(rs.getString("phan_tich_SWOT"));
		project.setPham_vi_cung_cap(rs.getString("pham_vi_cung_cap"));
		
		project.setTong_gia_tri_thuc_te(rs.getDouble("tong_gia_tri_thuc_te"));
		project.setDAC(rs.getDate("DAC"));
		project.setPAC(rs.getDate("PAC"));
		project.setFAC(rs.getDate("FAC"));
		project.setSo_tien_tam_ung(rs.getDouble("so_tien_tam_ung"));
		
		project.setKe_hoach_tam_ung(rs.getDate("ke_hoach_tam_ung"));
		project.setSo_tien_DAC(rs.getDouble("so_tien_DAC"));
		project.setKe_hoach_thanh_toan_DAC(rs.getDate("ke_hoach_thanh_toan_DAC"));
		project.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		project.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		
		project.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		project.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		project.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		project.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		project.setNote(rs.getString("note"));
		
		project.setCreated_at(rs.getDate("created_at"));
		
		return project;
	}

}
