package vn.ansv.Dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.UsersDto;
import vn.ansv.Dto.UsersDtoMapper;
import vn.ansv.Dto.Menu.MenuPicDto;
import vn.ansv.Dto.Menu.MenuPicDtoMapper;
import vn.ansv.Entity.Users;

@Repository
public class UsersDao extends BaseDao {
	
	private LocalDateTime _now = LocalDateTime.now();
	
	// Đếm tổng số bản ghi
	public int count() {
		String sql = "SELECT COUNT(*) FROM users";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}

	// Insert user
	public void save(Users users) {
		String sql = "INSERT INTO users (id, username, password, display_name, enabled, created_at, created_by) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, users.getId(), users.getUsername(), users.getPassword(), users.getDisplay_name(), 
				users.getEnabled(), _now, users.getCreated_by());
	}
	
	// Thêm role cho user
	public void saveRoleForUser(String username, String role) {
		String sql = "INSERT INTO users_roles (user, role) VALUES ((SELECT users.id FROM users WHERE users.username = ?), (SELECT role.id FROM role WHERE role.name = ?))";
		_jdbcTemplate.update(sql, username, role);
	}
	
	// Cập nhật role của user
	public void updateRoleByUser(String username, String role) {
		String sql = "UPDATE users_roles "
				+ "SET users_roles.role = (SELECT role.id FROM role WHERE role.name = ?) "
				+ "WHERE user = (SELECT users.id FROM users WHERE users.username = ?)";
		_jdbcTemplate.update(sql, role, username);
	}
	
	public List<UsersDto> getAllUsers() {
		List<UsersDto> list = new ArrayList<UsersDto>();
		String sql = "SELECT users.id,users.username, "
				+ "(SELECT role.name FROM role WHERE role.id = (SELECT MIN(role) FROM users_roles WHERE users_roles.user = users.id)) AS role,"
				+ " users.display_name, users.enabled, users.created_at, users.created_by "
				+ "FROM users "
				+ "WHERE username IS NOT NULL";
		list = _jdbcTemplate.query(sql, new UsersDtoMapper());
		return list;
	}
	
// Get the current user's information
	public UsersDto getByUser(String username) {
		String sql = "SELECT users.id, users.username, role.name AS role, users.display_name, "
				+ "users.enabled, users.created_at, users.created_by FROM users INNER JOIN users_roles "
				+ "on users.id = users_roles.user INNER JOIN role on users_roles.role = role.id "
				+ "WHERE username = ? LIMIT 1";
		return _jdbcTemplate.queryForObject(sql, new UsersDtoMapper(), username);
	}
// End

	public int getCountUsersRole(String username) {
		String sql = "SELECT count(*) FROM users INNER JOIN users_roles "
				+ "ON users.id = users_roles.user INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE username = ?";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class, username);
		return result;
	}
	
	// Kiểm tra username đã tồn tại trên database chưa
	public int checkUserExist(String username) {
		String sql = "SELECT count(*) FROM users WHERE username = ?";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class, username);
		return result;
	}
	
	// Truy vấn role của user
	public String findRoleByUser(String username) {
		String sql = "SELECT role.name FROM role "
				+ "INNER JOIN users_roles ON role.id = users_roles.role "
				+ "INNER JOIN users ON users_roles.user = users.id "
				+ "WHERE users.username = ?";
		String result = _jdbcTemplate.queryForObject(sql, String.class, username);
		return result;
	}
	
	// Kiểm tra role trên LDAP với role sãn có trên database
	public int checkUsersRoleExist(String username, String role) {
		String sql = "SELECT count(*) FROM role "
				+ "INNER JOIN users_roles ON role.id = users_roles.role "
				+ "INNER JOIN users ON users_roles.user = users.id "
				+ "WHERE users.username = ? AND role.name = ?";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class, username, role);
		return result;
	}
	
	// Get data for menu showing PIC with project ----- (1)
	public List<MenuPicDto> getMenu(int week, int year) {
		String sql = "SELECT users.id AS pic_id, users.display_name, COUNT(*) AS number "
				+ "FROM project "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE week = ? AND year = ? "
				+ "AND role.name = IF((SELECT COUNT(*) "
									+ "FROM pic "
									+ "INNER JOIN users ON pic.pic = users.id "
									+ "INNER JOIN users_roles ON users.id = users_roles.user "
									+ "INNER JOIN role ON users_roles.role = role.id "
									+ "WHERE pic.project_id = project.id AND role.name = 'ROLE_PM') = 1, 'ROLE_PM', 'ROLE_AM') GROUP BY users.display_name";
		return _jdbcTemplate.query(sql, new MenuPicDtoMapper(), week, year);
	}
	
	// Đếm số bản ghi theo mã pic từ danh sách lấy được từ (1)
	public int getCountFrom1(String pic) {
		String sql = "SELECT COUNT(*) "
				+ "FROM (SELECT users.id AS pic "
						+ "FROM project "
						+ "INNER JOIN pic ON project.id = pic.project_id "
						+ "INNER JOIN users ON pic.pic = users.id "
						+ "INNER JOIN users_roles ON users.id = users_roles.user "
						+ "INNER JOIN role ON users_roles.role = role.id "
						+ "WHERE week = ? AND year = ? "
						+ "AND role.name = IF((SELECT COUNT(*) FROM pic "
											+ "INNER JOIN users ON pic.pic = users.id "
											+ "INNER JOIN users_roles ON users.id = users_roles.user "
											+ "INNER JOIN role ON users_roles.role = role.id "
											+ "WHERE pic.project_id = project.id AND role.name = 'ROLE_PM') = 1, 'ROLE_PM', 'ROLE_AM')) AS view_count";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class, pic);
		return result;
	}

}
