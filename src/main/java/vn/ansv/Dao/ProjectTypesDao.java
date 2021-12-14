package vn.ansv.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Entity.ProjectTypes;
import vn.ansv.Entity.ProjectTypesMapper;

@Repository
public class ProjectTypesDao extends BaseDao {
	
	public List<ProjectTypes> getAll() {
		String sql = "SELECT id, name, COUNT(*) AS number FROM projects_types GROUP BY name";
		return _jdbcTemplate.query(sql, new ProjectTypesMapper());
	} 
	
	// Lấy dữ liệu cho phần menu (CEO)
	public List<ProjectTypes> getAllByWeek(int week) {
		String sql = "SELECT projects_types.id, projects_types.name, COUNT(*) AS number FROM projects_types "
				+ "INNER JOIN project ON projects_types.id = project.project_type "
				+ "WHERE project.week = ? "
				+ "GROUP BY projects_types.name "
				+ "ORDER BY projects_types.id";
		return _jdbcTemplate.query(sql, new ProjectTypesMapper(), week);
	}
	
}
