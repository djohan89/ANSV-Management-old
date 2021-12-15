package vn.ansv.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.DashboardProjectsDto;
import vn.ansv.Dto.DashboardProjectsDtoMapper;
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

}
