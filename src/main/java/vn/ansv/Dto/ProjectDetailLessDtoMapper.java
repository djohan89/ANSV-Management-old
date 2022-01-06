package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import vn.ansv.Entity.Project;

public class ProjectDetailLessDtoMapper implements RowMapper<Project> {

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
		Project.setDescription(rs.getString("description"));
		Project.setTong_muc_dau_tu_du_kien(rs.getString("tong_muc_dau_tu_du_kien"));
		Project.setHinh_thuc_dau_tu(rs.getString("hinh_thuc_dau_tu"));
		Project.setMuc_do_kha_thi(rs.getInt("muc_do_kha_thi"));
		Project.setPhan_tich_SWOT(rs.getString("phan_tich_SWOT"));
		Project.setTinh_trang_va_ke_hoach_chi_tiet(rs.getString("tinh_trang_va_ke_hoach_chi_tiet"));
		Project.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
		Project.setNote(rs.getString("note"));
		
		return Project;
	}

}
