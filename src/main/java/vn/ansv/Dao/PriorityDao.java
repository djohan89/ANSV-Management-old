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
	
}
