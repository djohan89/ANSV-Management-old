	package vn.ansv.Dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.DashboardProjectDto;
import vn.ansv.Dto.DashboardProjectDtoMapper;
import vn.ansv.Dto.DashboardProjectPicDto;
import vn.ansv.Dto.DashboardProjectPicDtoMapper;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.ProjectDetailDtoMapper;
import vn.ansv.Dto.ProjectStatisticsDto;
import vn.ansv.Dto.ProjectStatisticsDtoMapper;
import vn.ansv.Dto.SlideshowProjectsDto;
import vn.ansv.Dto.SlideshowProjectsDtoMapper;
import vn.ansv.Dto.Menu.MenuProjectsDto;
import vn.ansv.Dto.Menu.MenuProjectsDtoMapper;
import vn.ansv.Entity.Project;
import vn.ansv.Entity.ProjectDetailLessMapper;

@Repository
public class ProjectDao extends BaseDao {
	
	private LocalDateTime _now = LocalDateTime.now();

	// Danh sách dự án hiển thị lên menu (role CEO)
	public List<MenuProjectsDto> getMenu(int week, int year) {
		List<MenuProjectsDto> list = new ArrayList<MenuProjectsDto>();
		
		String sql = "SELECT project.id, users.id AS pic, project.name, project.week "
				+ "FROM project "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "WHERE week = ? AND year = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')";
		list = _jdbcTemplate.query(sql, new MenuProjectsDtoMapper(), week, year);
		return list;
	}
	
	
	
/* Đầu: Truy vấn dữ liệu (trang Dashboard) */
	/* Toàn bộ bản ghi hiển thị trên trang Dashboard (phần Datatable - role CEO) */
	public List<DashboardProjectDto> getDashboardTable(int week, int year) {
		List<DashboardProjectDto> list = new ArrayList<DashboardProjectDto>();
		
		String sql = "SELECT project.id, users.id AS id_user, users.display_name AS pic, role.name AS pic_role, projects_types.name AS type, priorities.name AS priority, projects_status.name AS status, "
				+ "customers.name AS customer, project.name AS project_name, project.tinh_trang_va_ke_hoach_chi_tiet, project.week "
				+ "FROM project "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')";
		list = _jdbcTemplate.query(sql, new DashboardProjectDtoMapper(), week, year);
		return list;
	}
	
	/* Toàn bộ bản ghi hiển thị trên trang Dashboard (phần Slideshow): Dự án triển khai */
	public List<SlideshowProjectsDto> getSlideshowProject(int week, int year) {
		List<SlideshowProjectsDto> list = new ArrayList<SlideshowProjectsDto>();
		
		String sql = "SELECT project.id AS id_pk, project.week, priorities.name AS priority, projects_status.name AS status, project.name, customers.name AS customer, "
				+ "(SELECT users.display_name FROM users "
					+ "INNER JOIN users_roles ON users.id = users_roles.user "
					+ "INNER JOIN role ON users_roles.role = role.id "
					+ "INNER JOIN pic ON users.id = pic.pic "
					+ "INNER JOIN project ON pic.project_id = project.id "
					+ "WHERE role.name = 'ROLE_PM' "
					+ "AND project.id = id_pk) AS pm, "
				+ "(SELECT users.display_name FROM users "
					+ "INNER JOIN users_roles ON users.id = users_roles.user "
					+ "INNER JOIN role ON users_roles.role = role.id "
					+ "INNER JOIN pic ON users.id = pic.pic "
					+ "INNER JOIN project ON pic.project_id = project.id "
					+ "WHERE role.name = 'ROLE_AM' AND project.id = id_pk) AS am, "
				+ "project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, project.DAC, project.PAC, project.FAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, "
				+ "project.so_tien_DAC, project.ke_hoach_thanh_toan_DAC, project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, project.so_tien_FAC, "
				+ "project.ke_hoach_thanh_toan_FAC, project.ket_qua_thuc_hien_ke_hoach, project.tinh_trang_va_ke_hoach_chi_tiet "
				+ "FROM project "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND project.project_type = 1 AND project.project_status = 1";
		
		list = _jdbcTemplate.query(sql, new SlideshowProjectsDtoMapper(), week, year);
		return list;
	}
/* Cuối: Truy vấn dữ liệu (trang Dashboard) */
	
	
	
	// Thống kê dự án cho phần header
	public List<ProjectStatisticsDto> getProjectStatistics(int week, int year) {
		List<ProjectStatisticsDto> list = new ArrayList<ProjectStatisticsDto>();
		
		String sql = "SELECT projects_types.name AS type, priorities.name AS priority, projects_status.name AS status "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "WHERE project.week = ? AND project.year = ?";
		
		list = _jdbcTemplate.query(sql, new ProjectStatisticsDtoMapper(), week, year);
		return list;
	}
	
	
	/*Truy vấn dữ liệu chi tiết của dự án theo id project */
	public List<ProjectDetailDto> getById(int id){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id, users.display_name AS pic_name, users.id AS pic_id , role.name AS pic_role, projects_types.name AS type, priorities.name AS priority, "
				+ "projects_status.name AS status, customers.name AS customer, project.name, project.tinh_trang_va_ke_hoach_chi_tiet, project.week, project.description, "
				+ "project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu, project.muc_do_kha_thi, project.phan_tich_SWOT, project.pham_vi_cung_cap, "
				+ "project.tong_gia_tri_thuc_te, project.DAC, project.FAC, project.PAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, project.so_tien_DAC, "
				+ "project.ke_hoach_thanh_toan_DAC, project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, project.so_tien_FAC, project.ke_hoach_thanh_toan_FAC, "
				+ "project.ket_qua_thuc_hien_ke_hoach ,project.note "
				+ "FROM project INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.id = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')";
		
		list = _jdbcTemplate.query(sql, new ProjectDetailDtoMapper(), id);
		return list;
		
	}
	
	/*Truy vấn dữ liệu (Chuyển đổi số hoặc Viễn thông) chi tiết của dự án theo id project */
	public Project getLessById(int id, String pic){
		Project object = new Project();
		String sql = "SELECT project.id, projects_types.id AS project_type, priorities.id AS priority, projects_status.id AS project_status, customers.id AS customer, "
				+ "project.week, project.year, project.name, project.description, project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu, project.muc_do_kha_thi, "
				+ "project.phan_tich_SWOT, project.tinh_trang_va_ke_hoach_chi_tiet, project.ket_qua_thuc_hien_ke_hoach, project.note "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "WHERE project.id = ? AND pic.pic = ?";
		
		object = _jdbcTemplate.queryForObject(sql, new ProjectDetailLessMapper(), id, pic);
		return object;
		
	}
	
	/*Truy vấn dữ liệu chi tiết của sản phẩm theo id project của mỗi PIC */
	public List<ProjectDetailDto> getByIdAndPic(int id, String pic){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id, users.display_name AS pic_name, users.id AS pic_id , role.name AS pic_role, projects_types.name AS type, priorities.name AS priority, "
				+ "projects_status.name AS status, customers.name AS customer, project.name, project.tinh_trang_va_ke_hoach_chi_tiet, project.week, project.description, "
				+ "project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu, project.muc_do_kha_thi, project.phan_tich_SWOT, project.pham_vi_cung_cap, "
				+ "project.tong_gia_tri_thuc_te, project.DAC, project.FAC, project.PAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, project.so_tien_DAC, "
				+ "project.ke_hoach_thanh_toan_DAC, project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, project.so_tien_FAC, project.ke_hoach_thanh_toan_FAC, "
				+ "project.ket_qua_thuc_hien_ke_hoach ,project.note "
				+ "FROM project INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.id = ? AND pic.pic = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')";
		
		list = _jdbcTemplate.query(sql, new ProjectDetailDtoMapper(), id, pic);
		return list;
		
	}
	
	/*Truy vấn dữ liệu chi tiết của sản phẩm theo khách hàng,tuần và theo loại project */
	public List<ProjectDetailDto> getAllProjectByCustomer(int week, int year, int customer, int type){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id, users.display_name AS pic_name, users.id AS pic_id , role.name AS pic_role, projects_types.name AS type, priorities.name AS priority, "
				+ "projects_status.name AS status,customers.name AS customer, project.name, project.tinh_trang_va_ke_hoach_chi_tiet, project.week, project.description, "
				+ "project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu,project.muc_do_kha_thi,project.phan_tich_SWOT,project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, "
				+ "project.DAC, project.FAC, project.PAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung,project.so_tien_DAC, project.ke_hoach_thanh_toan_DAC, project.so_tien_PAC,"
				+ "project.ke_hoach_thanh_toan_PAC, project.so_tien_FAC, project.ke_hoach_thanh_toan_FAC, project.ket_qua_thuc_hien_ke_hoach, project.note "
				+ "FROM project INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND customers.id = ? AND projects_types.id  = ? "
				+ "AND (role.name = 'ROLE_AM' OR role.name = 'ROLE_PM')";
				
		list = _jdbcTemplate.query(sql, new ProjectDetailDtoMapper(), week, year, customer, type);
		return list;
		
	}
	
	/*Truy vấn danh sách dữ liệu theo pic  */
	public List<DashboardProjectPicDto> getDashboardTableByPIC(int week, int year, String pic_id) {
		List<DashboardProjectPicDto> list = new ArrayList<DashboardProjectPicDto>();
		
		String sql = "SELECT project.id AS id_pk, project.week, project.year, priorities.name AS priority, projects_status.name AS status, project.name, customers.name AS customer, projects_types.name AS type, "
				+ "(SELECT users.display_name FROM users "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN pic ON users.id = pic.pic "
				+ "INNER JOIN project ON pic.project_id = project.id "
				+ "WHERE role.name = 'ROLE_PM' AND project.id = id_pk) AS pm, "
				+ "(SELECT users.display_name FROM users "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN pic ON users.id = pic.pic "
				+ "INNER JOIN project ON pic.project_id = project.id WHERE role.name = 'ROLE_AM' "
				+ "AND project.id = id_pk) AS am, project.tinh_trang_va_ke_hoach_chi_tiet "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN pic ON project.id =pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND users.id = ?";
		list = _jdbcTemplate.query(sql, new DashboardProjectPicDtoMapper(), week, year, pic_id);
		return list;
	}
	
	
	
/* ===== Đầu: Account Manager ===== */
	public int getMaxId(){
		String sql ="SELECT MAX(id) FROM project";
		return _jdbcTemplate.queryForObject(sql, Integer.class);
		
	}
	
	// Tạo dụ án (VIễn thông / Chuyển đổi số)
	public void save(Project project) {
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, name, description, "
				+ "tong_muc_dau_tu_du_kien, hinh_thuc_dau_tu, muc_do_kha_thi, phan_tich_SWOT, tinh_trang_va_ke_hoach_chi_tiet, "
				+ "ket_qua_thuc_hien_ke_hoach, created_at) VALUES (?, ?, ?, ?, ?, ?, year(curdate()), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), project.getProject_status(), project.getCustomer(), 
				project.getWeek(), project.getName(), project.getDescription(), project.getTong_muc_dau_tu_du_kien(), project.getHinh_thuc_dau_tu(), 
				project.getMuc_do_kha_thi(), project.getPhan_tich_SWOT(), project.getTinh_trang_va_ke_hoach_chi_tiet(), 
				project.getKet_qua_thuc_hien_ke_hoach(), _now);
	}
	
	// Tạo dụ án (Triển khai)
	public void saveDeloyment(Project project) {
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, name, description, "
				+ "tong_muc_dau_tu_du_kien, hinh_thuc_dau_tu, muc_do_kha_thi, phan_tich_SWOT, tinh_trang_va_ke_hoach_chi_tiet, "
				+ "ket_qua_thuc_hien_ke_hoach, created_at) VALUES (?, ?, ?, ?, ?, ?, year(curdate()), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), project.getProject_status(), project.getCustomer(), 
				project.getWeek(), project.getName(), project.getDescription(), project.getTong_muc_dau_tu_du_kien(), project.getHinh_thuc_dau_tu(), 
				project.getMuc_do_kha_thi(), project.getPhan_tich_SWOT(), project.getTinh_trang_va_ke_hoach_chi_tiet(), 
				project.getKet_qua_thuc_hien_ke_hoach(), _now);
	}
	
	public void update(Project project) {
		String sql = "UPDATE project SET project_type = ?, priority = ?, project_status = ?, customer = ?, week = ?, year = ?, name = ?, description = ?, "
				+ "tong_muc_dau_tu_du_kien = ?, hinh_thuc_dau_tu = ?, muc_do_kha_thi = ?, phan_tich_SWOT = ?, tinh_trang_va_ke_hoach_chi_tiet = ?, "
				+ "ket_qua_thuc_hien_ke_hoach = ?, created_at = ?, note = ? "
				+ "WHERE id = ?";
		_jdbcTemplate.update(sql, project.getProject_type(), project.getPriority(), project.getProject_status(), project.getCustomer(), project.getWeek(), project.getYear(), 
				project.getName(), project.getDescription(), project.getTong_muc_dau_tu_du_kien(), project.getHinh_thuc_dau_tu(), project.getMuc_do_kha_thi(), 
				project.getPhan_tich_SWOT(), project.getTinh_trang_va_ke_hoach_chi_tiet(), project.getKet_qua_thuc_hien_ke_hoach(), _now, project.getNote(), 
				project.getId());
	}
	
	public void delete(int id) {
		String sql = "DELETE FROM project WHERE id = " + id;
		_jdbcTemplate.update(sql);
	}
	
	public int getTypeForProject(int id){
		String sql ="SELECT project_type FROM project WHERE id = " + id;
		return _jdbcTemplate.queryForObject(sql, Integer.class);
		
	}
/* ===== Cuối: Account Manager ===== */

}
