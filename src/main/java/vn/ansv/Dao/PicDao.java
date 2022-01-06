package vn.ansv.Dao;

import org.springframework.stereotype.Repository;

@Repository
public class PicDao extends BaseDao {

/* ===== Đầu: Account Manager ===== */
	public void save(int project_id, String pic) {
		String sql = "INSERT INTO pic (project_id, pic) VALUES (?, ?)";
		_jdbcTemplate.update(sql, project_id, pic);
	}
	
	public void delete(int project_id) {
		String sql = "DELETE FROM pic WHERE project_id = " + project_id;
		_jdbcTemplate.update(sql);
	}
/* ===== Cuối: Account Manager ===== */
	
}
