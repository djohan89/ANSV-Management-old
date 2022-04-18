package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectDetailDtoMapper implements RowMapper<ProjectDetailDto> {

	public ProjectDetailDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ProjectDetailDto detail = new ProjectDetailDto();
		
		detail.setId(rs.getInt("id"));
		detail.setType_id(rs.getInt("type_id"));
		detail.setType(rs.getString("type"));
		detail.setPriority(rs.getString("priority"));
		detail.setStatus(rs.getString("status"));
		
		detail.setCustomer(rs.getString("customer"));
		detail.setWeek(rs.getInt("week"));
//		detail.setYear(rs.getInt("year"));
		detail.setName(rs.getString("name"));
		detail.setDescription(rs.getString("description"));
		
		detail.setTong_muc_dau_tu_du_kien(rs.getString("tong_muc_dau_tu_du_kien"));
		detail.setHinh_thuc_dau_tu(rs.getString("hinh_thuc_dau_tu"));
		detail.setMuc_do_kha_thi(rs.getInt("muc_do_kha_thi"));
		detail.setPhan_tich_SWOT(rs.getString("phan_tich_SWOT"));
		detail.setPham_vi_cung_cap(rs.getString("pham_vi_cung_cap"));
		detail.setTong_gia_tri_thuc_te(rs.getDouble("tong_gia_tri_thuc_te"));
		
		detail.setDAC(rs.getDate("DAC"));
		detail.setPAC(rs.getDate("PAC"));
		detail.setFAC(rs.getDate("FAC"));
		detail.setSo_tien_tam_ung(rs.getDouble("so_tien_tam_ung"));
		detail.setKe_hoach_tam_ung(rs.getDate("ke_hoach_tam_ung"));
		
		detail.setSo_tien_DAC(rs.getDouble("so_tien_DAC"));
		detail.setKe_hoach_thanh_toan_DAC(rs.getDate("ke_hoach_thanh_toan_DAC"));
		detail.setThuc_te_thanh_toan_DAC(rs.getDate("thuc_te_thanh_toan_DAC"));
//		detail.setChenh_lech_DAC(rs.getInt("chenh_lech_DAC"));
		
		detail.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		detail.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		detail.setThuc_te_thanh_toan_PAC(rs.getDate("thuc_te_thanh_toan_PAC"));
//		detail.setChenh_lech_PAC(rs.getInt("chenh_lech_PAC"));
		
		detail.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		detail.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		detail.setThuc_te_thanh_toan_FAC(rs.getDate("thuc_te_thanh_toan_FAC"));
//		detail.setChenh_lech_FAC(rs.getInt("chenh_lech_FAC"));
		
		detail.setKe_hoach(rs.getString("ke_hoach"));
		detail.setGeneral_issue(rs.getString("general_issue"));
		detail.setSolution(rs.getString("solution"));
		detail.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		detail.setNote(rs.getString("note"));
		detail.setInteractive(rs.getString("interactive"));
		
		detail.setPic_id(rs.getString("pic_id"));
		detail.setPic_name(rs.getString("pic_name"));
		detail.setPic_role(rs.getString("pic_role"));
		
		return detail;
	}

}
