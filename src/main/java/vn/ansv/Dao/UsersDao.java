package vn.ansv.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.UsersDto;
import vn.ansv.Dto.UsersDtoMapper;
import vn.ansv.Dto.Menu.MenuPicDto;
import vn.ansv.Dto.Menu.MenuPicDtoMapper;

@Repository
public class UsersDao extends BaseDao {

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
