package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectDetailDtoMapper implements RowMapper<ProjectDetailDto> {

	public ProjectDetailDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProjectDetailDto detail = new ProjectDetailDto();
		detail.setId(rs.getInt("id"));
		detail.setPic_id(rs.getString("pic_id"));
		detail.setPic_name(rs.getString("pic_name"));
		detail.setType(rs.getString("type"));
		detail.setPriority(rs.getString("priority"));
		detail.setStatus(rs.getString("status"));
		detail.setCustomer(rs.getString("customer"));
		detail.setName(rs.getString("name"));
		detail.setPic_role(rs.getString("pic_role"));
		detail.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		detail.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
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
		detail.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
		detail.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
		detail.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
		detail.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
		detail.setNote(rs.getString("note"));
		detail.setWeek(rs.getInt("week"));
		detail.setInteractive(rs.getString("interactive"));
		
		return detail;
	}

}
