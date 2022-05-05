package vn.ansv.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.Menu.MenuPicDto;
import vn.ansv.Dto.Menu.MenuPicDtoMapper;

@Repository
public class PicDao extends BaseDao {

/* ===== Đầu: Account Manager ===== */
	public void save(int project_id, String pic) {
		String sql = "INSERT INTO pic (project_id, pic) VALUES (?, ?)";
		_jdbcTemplate.update(sql, project_id, pic); // Nếu PIC là Project Manager (Triển khai), cột note sẽ chứa id của Account Manager
	}
	
	public void delete(int project_id) {
		String sql = "DELETE FROM pic WHERE project_id = " + project_id;
		_jdbcTemplate.update(sql);
	}
	
	public String getPICByProjectId(int project_id){
		String sql ="SELECT pic.pic "
				+ "FROM pic "
				+ "INNER JOIN users_roles ON pic.pic = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE project_id = "+ project_id 
				+ " AND role.name = 'ROLE_AM'";
		return _jdbcTemplate.queryForObject(sql, String.class);
		
	}
	
	public List<MenuPicDto> getAllPicForm(){
		String sql ="SELECT users.id AS pic_id, users.display_name FROM users "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE role.name = 'ROLE_PM' AND users.enabled = 1 ORDER BY users.display_name";
		
		return _jdbcTemplate.query(sql, new MenuPicDtoMapper() {
			public MenuPicDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MenuPicDto pic = new MenuPicDto();
				
				pic.setPic_id(rs.getString("pic_id"));
				pic.setDisplay_name(rs.getString("display_name"));
				
				return pic;
			}
		});
		
	}
/* ===== Cuối: Account Manager ===== */
	
	public int getAllPicOfProject(int id, String pic_id){
		String sql ="SELECT COUNT(*) FROM pic WHERE project_id = ? AND pic = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, id, pic_id);
		
	}
	
	// Check if pic issets
	public int checkUsersIssets(String pic_name){
		String sql ="SELECT count(*) FROM pic INNER JOIN users ON pic.pic = users.id WHERE users.display_name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, pic_name);
	}
	
	// Get pic id by name
	public String getIdByName(String pic_name){
		String sql ="SELECT users.id FROM users WHERE users.display_name = ?";
		return _jdbcTemplate.queryForObject(sql, String.class, pic_name);
	}
	
	public String getAllPicByProjectAndRole(int project_id, String role_name){
		String sql ="SELECT users.display_name FROM users "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN pic ON users.id = pic.pic "
				+ "INNER JOIN project ON pic.project_id = project.id "
				+ "WHERE project.id = ? AND role.name = ? LIMIT 1";
		
		return _jdbcTemplate.queryForObject(sql, String.class, project_id, role_name);
		
	}
	
}
