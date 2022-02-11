package vn.ansv.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.Menu.MenuCustomersDto;
import vn.ansv.Dto.Menu.MenuCustomersDtoMapper;
import vn.ansv.Entity.Customer;
import vn.ansv.Entity.CustomerMapper;

@Repository
public class CustomersDao extends BaseDao {

	private LocalDateTime _now = LocalDateTime.now();
	
	// Lấy dữ liệu cho phần menu (CEO)
	public List<MenuCustomersDto> getMenu(int week, int year) {
		String sql = "SELECT project.id AS project_id, projects_types.name AS project_type, "
				+ "customers.id AS customer_id, customers.name AS customer, COUNT(*) AS number, project.week "
				+ "FROM customers "
				+ "INNER JOIN project ON customers.id = project.customer "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "WHERE project.week = ? AND project.year = ? "
				+ "GROUP BY customers.name, project.project_type";
		return _jdbcTemplate.query(sql, new MenuCustomersDtoMapper(), week, year);
	} 
	
	public List<Customer> getAll(){
		String sql ="SELECT customers.id, customers.name, customers.created_at, users.display_name AS created_by FROM customers "
				+ "INNER JOIN users ON customers.created_by = users.id";
		return _jdbcTemplate.query(sql, new CustomerMapper());
	}
	
	public List<Customer> getAllCustomerForm(){
		String sql ="SELECT id, name FROM customers";
		
		return _jdbcTemplate.query(sql, new CustomerMapper() {
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Customer customer = new Customer();
				
				customer.setId(rs.getInt("id"));
				customer.setName(rs.getString("name"));
				
				return customer;
			}
		});
		
	}
	
	public int getCount(){
		String sql ="SELECT count(*) FROM customers";
		return _jdbcTemplate.queryForObject(sql, Integer.class);
		
	}
	
	public List<Customer> getTest(){
		String sql ="SELECT * FROM customers";
		
		return _jdbcTemplate.query(sql, new CustomerMapper());
		
	}
	
	// Thêm khách hàng
	public void save(Customer customer) {
		String sql = "INSERT INTO customers (name, created_by, created_at) VALUES (?, ?, ?)";
		_jdbcTemplate.update(sql, customer.getName(), customer.getCreated_by(), _now);
	}
}
