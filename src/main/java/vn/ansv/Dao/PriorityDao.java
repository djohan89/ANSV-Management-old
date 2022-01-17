package vn.ansv.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Entity.Priority;
import vn.ansv.Entity.PriorityMapper;

@Repository
public class PriorityDao extends BaseDao{
	public List<Priority> getAllPriorityForm(){
		String sql = "SELECT * FROM priorities";
		
		return _jdbcTemplate.query(sql, new PriorityMapper());
		
	}
	public List<Priority> getAllStatusForm(){
		String sql = "SELECT * FROM projects_status";
		
		return _jdbcTemplate.query(sql, new PriorityMapper());
	}
	
	public List<Priority> getAllTypeForm(){
		String sql = "SELECT * FROM projects_types";
		
		return _jdbcTemplate.query(sql, new PriorityMapper());
	}
	
	public Priority getAllProductForm(int id){
		String sql = "SELECT * FROM products WHERE id = ?";
		
		return _jdbcTemplate.queryForObject(sql, new PriorityMapper(),id);
	}
	
	public void update_prd(Priority product) {
		String sql ="UPDATE products SET name = ? WHERE id = ?";
		_jdbcTemplate.update(sql,product.getName(),product.getId());
	}
	
}
