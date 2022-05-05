package vn.ansv.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import vn.ansv.Dto.Import.ProjectImport;
import vn.ansv.Dto.Import.ProjectImportMapper;

public class BaseDao {
	
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public String sql_project_export(int type){
		String columns_select = "";
		
		if (type == 1) {
			/* Cột dữ liệu cần cho chi tiết dự án Triển khai */
			columns_select = "project.id, projects_types.name AS type, priorities.name AS priority, "
					+ "projects_status.name AS status, customers.name AS customer, project.week, "
					+ "project.year, project.projects_id, project.ma_so_ke_toan, project.name, "
					+ "project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, project.DAC, "
					+ "project.FAC, project.PAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, "
					+ "project.so_tien_DAC, project.ke_hoach_thanh_toan_DAC, project.thuc_te_thanh_toan_DAC, "
					+ "project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, project.thuc_te_thanh_toan_PAC, "
					+ "project.so_tien_FAC, project.ke_hoach_thanh_toan_FAC, project.thuc_te_thanh_toan_FAC, "
					+ "project.ke_hoach, project.general_issue, project.solution, "
					+ "project.ket_qua_thuc_hien_ke_hoach ";
		} else if (type == 2 || type ==3) {
			/* Cột dữ liệu cần cho chi tiết dự án Viễn thông / Chuyển đổi số */
			columns_select = "project.id AS project_id, users.display_name AS pic_name, projects_types.name AS project_type, "
					+ "priorities.name AS priority, projects_status.name AS project_status, customers.name, project.week, "
					+ "project.year, project.name, project.description, project.tong_muc_dau_tu_du_kien, "
					+ "project.hinh_thuc_dau_tu, project.muc_do_kha_thi, project.phan_tich_SWOT, project.general_issue, "
					+ "project.ke_hoach, project.ket_qua_thuc_hien_ke_hoach ";
		}
		
		return columns_select;
	}
	
	public ProjectImportMapper mapper_project_export(int type){
		ProjectImportMapper mapper = null;
		
		if (type == 1) {
			/* Mapper cho chi tiết dự án Triển khai */
			mapper = new ProjectImportMapper() {
				public ProjectImport mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProjectImport projectImport = new ProjectImport();
					
					projectImport.setId(rs.getInt("id"));
					projectImport.setType(rs.getString("type"));
					projectImport.setPriority(rs.getString("priority"));
					projectImport.setStatus(rs.getString("status"));
					projectImport.setCustomer(rs.getString("customer"));
					
					projectImport.setWeek(rs.getInt("week"));
					projectImport.setYear(rs.getInt("year"));
					projectImport.setProjects_id(rs.getString("projects_id"));
					projectImport.setMa_so_ke_toan(rs.getString("ma_so_ke_toan"));
					projectImport.setName(rs.getString("name"));
					
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
					
					projectImport.setSo_tien_PAC(rs.getDouble("so_tien_PAC"));
					projectImport.setKe_hoach_thanh_toan_PAC(rs.getDate("ke_hoach_thanh_toan_PAC"));
					projectImport.setThuc_te_thanh_toan_PAC(rs.getDate("thuc_te_thanh_toan_PAC"));
					
					projectImport.setSo_tien_FAC(rs.getDouble("so_tien_FAC"));
					projectImport.setKe_hoach_thanh_toan_FAC(rs.getDate("ke_hoach_thanh_toan_FAC"));
					projectImport.setThuc_te_thanh_toan_FAC(rs.getDate("thuc_te_thanh_toan_FAC"));
					
					projectImport.setKe_hoach(rs.getString("ke_hoach"));
					projectImport.setGeneral_issue(rs.getString("general_issue"));
					projectImport.setSolution(rs.getString("solution"));
					projectImport.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
					
					return projectImport;
				}
			};
		} else if (type == 2 || type ==3) {
			/* Mapper cho chi tiết dự án Viễn thông / Chuyển đổi số */
			mapper = new ProjectImportMapper() {
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
					
					projectImport.setKe_hoach(rs.getString("ke_hoach"));
					projectImport.setGeneral_issue(rs.getString("general_issue"));
					projectImport.setSolution(rs.getString("solution"));
					projectImport.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
					
					return projectImport;
				}
			};
		}
		
		return mapper;
	}
}
