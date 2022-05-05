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
	
	// Check if priority issets
	public int checkPriorityIssets(String priority_name){
		String sql ="SELECT count(*) FROM priorities WHERE priorities.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, priority_name);
	}
	
	// Get priority id by name
	public int getPriorityIdByName(String priority_name){
		String sql ="SELECT priorities.id FROM priorities WHERE priorities.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, priority_name);
	}
	
	// Check if status issets
	public int checkStatusIssets(String status_name){
		String sql ="SELECT count(*) FROM projects_status WHERE projects_status.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, status_name);
	}
	
	// Get status id by name
	public int getStatusIdByName(String status_name){
		String sql ="SELECT projects_status.id FROM projects_status WHERE projects_status.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, status_name);
	}
	
}
