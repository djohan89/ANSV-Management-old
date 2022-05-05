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
		String sql ="SELECT customers.id, customers.name, customers.created_by, users.display_name, customers.created_at "
				+ "FROM customers INNER JOIN users ON customers.created_by = users.id WHERE customers.enabled = 1";
		return _jdbcTemplate.query(sql, new CustomerMapper());
	}
	
	public List<Customer> getAllCustomerForm(){
		String sql ="SELECT id, name FROM customers WHERE enabled = 1 ORDER BY name";
		
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
		String sql ="SELECT count(*) FROM customers WHERE enabled = 1";
		return _jdbcTemplate.queryForObject(sql, Integer.class);
		
	}
	
	public List<Customer> getTest(){
		String sql ="SELECT * FROM customers";
		
		return _jdbcTemplate.query(sql, new CustomerMapper());
		
	}
	
	// Thêm khách hàng
	public void save(Customer customer) {
		String sql = "INSERT INTO customers (name, enabled, created_by, created_at) VALUES (?, 1, ?, ?)";
		_jdbcTemplate.update(sql, customer.getName(), customer.getCreated_by(), _now);
	}
	
	// Cập nhật khách hàng
	public void update(Customer customer) {
		String sql = "UPDATE customers SET name = ?, created_at = ? WHERE id = ?";
		_jdbcTemplate.update(sql, customer.getName(), _now, customer.getId());
	}
	
	// Xoá khách hàng (thực tế chỉ là chuyển tình trạng ko đc hoạt động của khách hàng đó)
	public void enabled_customer(int id) {
		String sql ="UPDATE customers SET enabled = 0 WHERE id = ?";
		_jdbcTemplate.update(sql, id);
	}
	
	// Check if customer issets
	public int checkIssets(String customer_name){
		String sql ="SELECT count(*) FROM customers WHERE customers.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, customer_name);
	}
	
	// Get customer id by name
	public int getIdByName(String customer_name){
		String sql ="SELECT customers.id FROM customers WHERE customers.name = ?";
		return _jdbcTemplate.queryForObject(sql, Integer.class, customer_name);
	}
}
