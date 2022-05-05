package vn.ansv.Dto.Import;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectImportMapper implements RowMapper<ProjectImport> {

	public ProjectImport mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProjectImport projectImport = new ProjectImport();
		
		projectImport.setId(rs.getInt("id"));
		projectImport.setType_id(rs.getInt("type_id"));
		projectImport.setType(rs.getString("type"));
		projectImport.setPriority(rs.getString("priority"));
		projectImport.setStatus(rs.getString("status"));
		
		projectImport.setCustomer(rs.getString("customer"));
		projectImport.setWeek(rs.getInt("week"));
		projectImport.setYear(rs.getInt("year"));
		projectImport.setName(rs.getString("name"));
		projectImport.setDescription(rs.getString("description"));
		
		projectImport.setTong_muc_dau_tu_du_kien(rs.getString("tong_muc_dau_tu_du_kien"));
		projectImport.setHinh_thuc_dau_tu(rs.getString("hinh_thuc_dau_tu"));
		projectImport.setMuc_do_kha_thi(rs.getInt("muc_do_kha_thi"));
		projectImport.setPhan_tich_SWOT(rs.getString("phan_tich_SWOT"));
		projectImport.setPham_vi_cung_cap(rs.getString("pham_vi_cung_cap")); // Tiến độ chung
		projectImport.setTong_gia_tri_thuc_te(rs.getDouble("tong_gia_tri_thuc_te"));
		
		projectImport.setDAC(rs.getDate("DAC"));
		projectImport.setPAC(rs.getDate("PAC"));
		projectImport.setFAC(rs.getDate("FAC"));
		projectImport.setSo_tien_tam_ung(rs.getDouble("so_tien_tam_ung"));
		projectImport.setKe_hoach_tam_ung(rs.getDate("ke_hoach_tam_ung"));
	
		projectImport.setSo_tien_DAC(rs.getDouble("so_tien_DAC"));
		projectImport.setKe_hoach_thanh_toan_DAC(rs.getDate("ke_hoach_thanh_toan_DAC"));
		projectImport.setThuc_te_thanh_toan_DAC(rs.getDate("thuc_te_thanh_toan_DAC"));
		projectImport.setChenh_lech_DAC(rs.getString("chenh_lech_DAC"));
		
		projectImport.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		projectImport.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		projectImport.setThuc_te_thanh_toan_PAC(rs.getDate("thuc_te_thanh_toan_PAC"));
		projectImport.setChenh_lech_PAC(rs.getString("chenh_lech_PAC"));
		
		projectImport.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		projectImport.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		projectImport.setThuc_te_thanh_toan_FAC(rs.getDate("thuc_te_thanh_toan_FAC"));
		projectImport.setChenh_lech_FAC(rs.getString("chenh_lech_FAC"));
		
		projectImport.setKe_hoach(rs.getString("ke_hoach"));
		projectImport.setGeneral_issue(rs.getString("general_issue"));
		projectImport.setSolution(rs.getString("solution"));
		projectImport.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		projectImport.setNote(rs.getString("note"));
		projectImport.setInteractive(rs.getString("interactive"));
		
		projectImport.setPic_name(rs.getString("pic_name"));

		return projectImport;
	}

}
