package vn.ansv.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.Menu.MenuCustomersDto;
import vn.ansv.Dto.Menu.MenuCustomersDtoMapper;
import vn.ansv.Entity.Customer;
import vn.ansv.Entity.CustomerMapper;

@Repository
public class CustomersDao extends BaseDao {

	// Lấy dữ liệu cho phần menu (CEO)
	public List<MenuCustomersDto> getAllByWeek(int week) {
		String sql = "SELECT project.id AS project_id, projects_types.name AS project_type,customers.id AS customer_id, customers.name AS customer, COUNT(*) AS number, project.week FROM customers "
				+ "INNER JOIN project ON customers.id = project.customer "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "WHERE project.week = ? "
				+ "GROUP BY customers.name, project.project_type";
		return _jdbcTemplate.query(sql, new MenuCustomersDtoMapper(), week);
	} 
	
	public List<Customer> getAllCustomer(){
		String sql ="SELECT * FROM customers";
		
		
		return _jdbcTemplate.query(sql, new CustomerMapper());
		
	}
}
