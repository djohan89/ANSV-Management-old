package vn.ansv.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.DashboardProjectsDto;
import vn.ansv.Dto.DashboardProjectsDtoMapper;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.ProjectDetailDtoMapper;
import vn.ansv.Dto.Menu.MenuProjectsDto;
import vn.ansv.Dto.Menu.MenuProjectsDtoMapper;

@Repository
public class ProjectDao extends BaseDao {

	// Get data for menu that showing project own each pic
	public List<MenuProjectsDto> getMenu(int week) {
		List<MenuProjectsDto> list = new ArrayList<MenuProjectsDto>();
		
		String sql = "SELECT project.id, users.id AS pic, project.name, week FROM project "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "WHERE week = ?";
		list = _jdbcTemplate.query(sql, new MenuProjectsDtoMapper(), week);
		return list;
	}
	
	// Get data for dashboard
	public List<DashboardProjectsDto> getDashboard(int week) {
		List<DashboardProjectsDto> list = new ArrayList<DashboardProjectsDto>();
		
		String sql = "";
		list = _jdbcTemplate.query(sql, new DashboardProjectsDtoMapper(), week);
		return list;
	}
	
	// Get data for content of dashboard (ROLE_CHIEF)
	public List<DashboardProjectsDto> getAllByWeek(int week) {
		List<DashboardProjectsDto> list = new ArrayList<DashboardProjectsDto>();
		
		String sql = "SELECT project.id, project.week, projects_types.name AS type, priorities.name AS priority, projects_status.name AS status, "
				+ "project.name, customers.name AS customer, users.id AS pic_id, users.display_name AS pic_name, "
				+ "(SELECT role.name FROM role INNER JOIN users_roles ON role.id = users_roles.role INNER JOIN users ON users_roles.user = users.id "
				+ "WHERE users.id = pic_id AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')) AS pic_role, project.tinh_trang_va_ke_hoach_chi_tiet "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "WHERE project.week = ?";
		
		list = _jdbcTemplate.query(sql, new DashboardProjectsDtoMapper(), week);
		return list;
	}
	
	public List<ProjectDetailDto> getAllDetailByweek(int week, int id){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id,project.name,project.week,projects_types.name AS type, priorities.name AS priority,"
				+ " projects_status.name AS status,customers.name AS customer,users.id AS pic_id, users.display_name AS pic_name,"
				+ "(SELECT role.name FROM role INNER JOIN users_roles ON role.id = users_roles.role INNER JOIN users ON users_roles.user = users.id"
				+ "                WHERE users.id = pic_id AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')) AS pic_role"
				+ ",project.description,project.tong_muc_dau_tu_du_kien,project.hinh_thuc_dau_tu,project.muc_do_kha_thi,project.phan_tich_SWOT,project.pham_vi_cung_cap,project.tong_gia_tri_thuc_te,project.DAC,project.FAC,"
				+ "project.PAC,project.so_tien_tam_ung,project.ke_hoach_tam_ung,project.so_tien_DAC,project.ke_hoach_thanh_toan_DAC,project.so_tien_PAC,project.ke_hoach_thanh_toan_PAC,"
				+ "project.so_tien_FAC,project.ke_hoach_thanh_toan_FAC,project.ket_qua_thuc_hien_ke_hoach,project.tinh_trang_va_ke_hoach_chi_tiet,project.note "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "WHERE project.week = ? "
				+ "AND project.id = ?";
		list = _jdbcTemplate.query(sql, new ProjectDetailDtoMapper(),week,id);
		return list;
		
	}

}
