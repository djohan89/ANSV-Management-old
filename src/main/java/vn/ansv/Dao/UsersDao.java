package vn.ansv.Dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.UsersDto;
import vn.ansv.Dto.UsersDtoMapper;
import vn.ansv.Dto.Menu.MenuPicDto;
import vn.ansv.Dto.Menu.MenuPicDtoMapper;

@Repository
public class UsersDao extends BaseDao {

	private LocalDateTime _now = LocalDateTime.now();

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
	
	// Get data for menu showing PIC with project
	public List<MenuPicDto> getAllByWeek(int week) {
		String sql = "SELECT users.id AS pic_id, users.display_name, COUNT(*) AS number "
				+ "FROM users "
				+ "INNER JOIN pic ON users.id = pic.pic "
				+ "INNER JOIN project ON pic.project_id = project.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE project.week = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM') "
				+ "GROUP BY users.display_name "
				+ "ORDER BY users.id";
		return _jdbcTemplate.query(sql, new MenuPicDtoMapper(), week);
	}

}
