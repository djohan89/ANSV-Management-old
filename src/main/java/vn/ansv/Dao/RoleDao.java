package vn.ansv.Dao;

import org.springframework.stereotype.Repository;

@Repository
public class RoleDao extends BaseDao {

	public int getCount() {
		String sql = "select count(*) from role WHERE name LIKE 'ROLE_%'";
		int result = _jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}
	
}
