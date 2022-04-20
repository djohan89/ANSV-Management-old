package vn.ansv.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vn.ansv.Dto.DashboardAmMapper;
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
import vn.ansv.Entity.ProjectDetailMoreMapper;
import vn.ansv.Entity.ProjectMapper;


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
				+ "AND role.name = IF((SELECT COUNT(*) FROM pic "
									+ "INNER JOIN users ON pic.pic = users.id "
									+ "INNER JOIN users_roles ON users.id = users_roles.user "
									+ "INNER JOIN role ON users_roles.role = role.id "
									+ "WHERE pic.project_id = project.id AND role.name = 'ROLE_PM') = 1, 'ROLE_PM', 'ROLE_AM')";
		list = _jdbcTemplate.query(sql, new MenuProjectsDtoMapper(), week, year);
		return list;
	}
	
	
	
/* Đầu: Truy vấn dữ liệu (trang Dashboard) */
	/* Toàn bộ bản ghi hiển thị trên trang Dashboard (phần Datatable - role CEO) */
	public List<DashboardProjectDto> getDashboardTable(int week, int year) {
		List<DashboardProjectDto> list = new ArrayList<DashboardProjectDto>();
		
		String sql = "SELECT project.id, users.id AS id_user, users.display_name AS pic, role.name AS pic_role, projects_types.name AS type, "
				+ "priorities.name AS priority, projects_status.name AS status, customers.name AS customer, project.name AS project_name, "
				+ "project.tinh_trang_va_ke_hoach_chi_tiet, project.week "
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
		
		String select_column = "project.id, projects_types.id AS type_id, projects_types.name AS type, "
				+ "priorities.name AS priority, projects_status.name AS status, customers.name AS customer, "
				+ "project.week, project.year, project.name, project.description, project.tong_muc_dau_tu_du_kien, "
				+ "project.hinh_thuc_dau_tu, project.muc_do_kha_thi, project.phan_tich_SWOT, "
				+ "project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, project.DAC, project.FAC, "
				+ "project.PAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, project.so_tien_DAC, "
				+ "project.ke_hoach_thanh_toan_DAC, project.thuc_te_thanh_toan_DAC, project.so_tien_PAC, "
				+ "project.ke_hoach_thanh_toan_PAC, project.thuc_te_thanh_toan_PAC, project.so_tien_FAC, "
				+ "project.ke_hoach_thanh_toan_FAC, project.thuc_te_thanh_toan_FAC, project.ke_hoach, "
				+ "project.general_issue, project.solution, project.ket_qua_thuc_hien_ke_hoach, "
				+ "project.note, project.interactive, users.id AS pic_id, users.display_name AS pic_name, "
				+ "role.name AS pic_role ";
		
		String sql = "SELECT " + select_column
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
				+ "project.phan_tich_SWOT, project.ke_hoach, project.general_issue, project.solution, project.ket_qua_thuc_hien_ke_hoach, project.note "
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
	
	public Project getMorebyId(int id, String pic) {
		Project object = new Project();
		String sql = "SELECT project.id, projects_types.id AS project_type, priorities.id AS priority, "
				+ "projects_status.id AS project_status, customers.id AS customer, project.week, "
				+ "project.year, project.name, project.projects_id AS project_id, project.ma_so_ke_toan, "
				+ "project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, project.DAC, project.PAC, "
				+ "project.FAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, project.so_tien_DAC, "
				+ "project.ke_hoach_thanh_toan_DAC, project.thuc_te_thanh_toan_DAC, project.so_tien_PAC, "
				+ "project.ke_hoach_thanh_toan_PAC, project.thuc_te_thanh_toan_PAC, project.so_tien_FAC, "
				+ "project.ke_hoach_thanh_toan_FAC, project.thuc_te_thanh_toan_FAC, "
				+ "project.tinh_trang_va_ke_hoach_chi_tiet, project.ke_hoach, project.general_issue, "
				+ "project.solution, project.ket_qua_thuc_hien_ke_hoach "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "WHERE project.id = ? AND pic.pic = ?";
		object = _jdbcTemplate.queryForObject(sql, new ProjectDetailMoreMapper(), id, pic);
		return object;
		
	}
	
	
	/*Truy vấn dữ liệu chi tiết của sản phẩm theo id project của mỗi PIC */
	public List<ProjectDetailDto> getByIdAndPic(int id, String pic){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id, users.display_name AS pic_name, users.id AS pic_id, "
				+ "role.name AS pic_role, projects_types.id AS type_id, projects_types.name AS type, "
				+ "priorities.name AS priority, projects_status.name AS status, customers.name AS customer, "
				+ "project.name, project.ke_hoach, project.general_issue, project.solution, project.week, "
				+ "project.description, project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu, "
				+ "project.muc_do_kha_thi, project.phan_tich_SWOT, project.pham_vi_cung_cap, "
				+ "project.tong_gia_tri_thuc_te, project.DAC, project.FAC, project.PAC, project.so_tien_tam_ung, "
				+ "project.ke_hoach_tam_ung, project.so_tien_DAC, project.ke_hoach_thanh_toan_DAC, thuc_te_thanh_toan_DAC, "
				+ "project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, thuc_te_thanh_toan_PAC, project.so_tien_FAC, "
				+ "project.ke_hoach_thanh_toan_FAC, thuc_te_thanh_toan_FAC, project.ket_qua_thuc_hien_ke_hoach, project.note, "
				+ "project.interactive "
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
	
	/*Truy vấn dữ liệu chi tiết của sản phẩm theo khách hàng, tuần và theo loại project */
	public List<ProjectDetailDto> getAllProjectByCustomer(int week, int year, int customer, int type){
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		String sql = "SELECT project.id, users.display_name AS pic_name, users.id AS pic_id , "
				+ "role.name AS pic_role, projects_types.id AS type_id, projects_types.name AS type, "
				+ "priorities.name AS priority, projects_status.name AS status, customers.name AS customer, "
				+ "project.name, project.ke_hoach, project.general_issue, project.solution, project.week, "
				+ "project.description, project.tong_muc_dau_tu_du_kien, project.hinh_thuc_dau_tu, "
				+ "project.muc_do_kha_thi, project.phan_tich_SWOT, project.pham_vi_cung_cap, "
				+ "project.tong_gia_tri_thuc_te, project.DAC, project.FAC, project.PAC, project.so_tien_tam_ung, "
				+ "project.ke_hoach_tam_ung, project.so_tien_DAC, project.ke_hoach_thanh_toan_DAC, "
				+ "project.thuc_te_thanh_toan_DAC, project.so_tien_PAC, project.ke_hoach_thanh_toan_PAC, "
				+ "project.thuc_te_thanh_toan_PAC, project.so_tien_FAC, project.ke_hoach_thanh_toan_FAC, "
				+ "project.thuc_te_thanh_toan_FAC, project.ket_qua_thuc_hien_ke_hoach, project.note, "
				+ "project.interactive "
				+ "FROM project INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN users_roles ON users.id = users_roles.user "
				+ "INNER JOIN role ON users_roles.role = role.id "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND customers.id = ? AND projects_types.id  = ? "
				+ "AND role.name = ?";
				
		list = _jdbcTemplate.query(sql, new ProjectDetailDtoMapper(), week, year, customer, type, (type == 1)?"ROLE_PM":"ROLE_AM");
		return list;
		
	}
	
	
	
/* ===== Đầu: Account Manager ===== */
	// Truy vấn dữ liệu màn hình Dashboard của role AM
	public List<DashboardProjectPicDto> getDashboardAM(int week, int year, String pic_id) {
		List<DashboardProjectPicDto> list = new ArrayList<DashboardProjectPicDto>();
		
		// Truy vấn tên của Project Manager
		String pm_name = "SELECT users.display_name FROM users "
						+ "INNER JOIN users_roles ON users.id = users_roles.user "
						+ "INNER JOIN role ON users_roles.role = role.id "
						+ "INNER JOIN pic ON users.id = pic.pic "
						+ "INNER JOIN project ON pic.project_id = project.id "
						+ "WHERE role.name = 'ROLE_PM' AND project.id = id_pk";
		// Truy vấn tên của Account Manager
		String am_name = "SELECT users.display_name FROM users "
						+ "INNER JOIN users_roles ON users.id = users_roles.user "
						+ "INNER JOIN role ON users_roles.role = role.id "
						+ "INNER JOIN pic ON users.id = pic.pic "
						+ "INNER JOIN project ON pic.project_id = project.id "
						+ "WHERE role.name = 'ROLE_AM' AND project.id = id_pk";
		
		// Kiểm tra xem dự án đã tiến đến giai đoạn triển khai hay chưa
		String deployment = "SELECT COUNT(*) FROM project WHERE note = id_pk AND project_type = 1";
		
		// Câu lệnh SQL chính
		String sql = "SELECT project.id AS id_pk, project.week, project.year, priorities.name AS priority, "
				+ "projects_status.name AS status, project.name, customers.name AS customer, projects_types.name AS type, "
				+ "(" + pm_name + ") AS pm, "
				+ "(" + am_name + ") AS am, "
				+ "project.ke_hoach, "
				+ "(" + deployment + ") AS note, interactive "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND users.id = ?";
		list = _jdbcTemplate.query(sql, new DashboardAmMapper(), week, year, pic_id);
		return list;
	}
	
	public int getMaxId(){
		String sql ="SELECT MAX(id) FROM project";
		return _jdbcTemplate.queryForObject(sql, Integer.class);
		
	}
	
	// Tạo dụ án (Viễn thông / Chuyển đổi số)
	public void save(Project project) {
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, name, "
				+ "description, tong_muc_dau_tu_du_kien, hinh_thuc_dau_tu, muc_do_kha_thi, phan_tich_SWOT, "
				+ "ke_hoach, general_issue, solution, ket_qua_thuc_hien_ke_hoach, note, interactive, created_at) "
				+ "VALUES (?, ?, ?, ?, ?, ?, year(curdate()), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), 
				project.getProject_status(), project.getCustomer(), project.getWeek(), project.getName(), 
				project.getDescription(), project.getTong_muc_dau_tu_du_kien(), project.getHinh_thuc_dau_tu(), 
				project.getMuc_do_kha_thi(), project.getPhan_tich_SWOT(), project.getKe_hoach(), 
				project.getGeneral_issue(), project.getSolution(), project.getKet_qua_thuc_hien_ke_hoach(), 
				project.getNote(), project.getInteractive(), _now);
	}
	
	
	
	// Lấy ra các trường phù hợp cho form chuyển giai đoạn dự án
	public Project getFormDeployment(int id) {
		Project list = new Project();
		
		String sql = "SELECT name, customer, priority, project_status, ke_hoach, general_issue, solution, "
				+ "ket_qua_thuc_hien_ke_hoach FROM project WHERE id = ?";
		list = _jdbcTemplate.queryForObject(sql, new ProjectMapper() {
			public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
				Project project = new Project();
				
				project.setName(rs.getString("name"));
				project.setCustomer(rs.getInt("customer"));
				project.setPriority(rs.getInt("priority"));
				project.setProject_status(rs.getInt("project_status"));
				project.setKe_hoach(rs.getString("ke_hoach"));
				project.setGeneral_issue(rs.getString("general_issue"));
				project.setSolution(rs.getString("solution"));
				project.setKet_qua_thuc_hien_ke_hoach(rs.getString("ket_qua_thuc_hien_ke_hoach"));
				
				return project;
			}
		}, id);
		return list;
	}
	
	// Tạo dụ án (Triển khai)
	public void saveDeployment(Project project, int id) {
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, projects_id, ma_so_ke_toan, name, "
				+ "pham_vi_cung_cap, tong_gia_tri_thuc_te, DAC, PAC, FAC, so_tien_tam_ung, ke_hoach_tam_ung, so_tien_DAC, ke_hoach_thanh_toan_DAC, thuc_te_thanh_toan_DAC, "
				+ "so_tien_PAC, ke_hoach_thanh_toan_PAC, thuc_te_thanh_toan_PAC, so_tien_FAC, ke_hoach_thanh_toan_FAC, thuc_te_thanh_toan_FAC, ke_hoach, general_issue, solution, "
				+ "ket_qua_thuc_hien_ke_hoach, note, created_at) "
				+ "VALUES (?, ?, ?, ?, ?, ?, year(curdate()), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), project.getProject_status(), project.getCustomer(), 
				project.getWeek(), project.getProject_id(), project.getMa_so_ke_toan(), project.getName(), project.getPham_vi_cung_cap(), 
				project.getTong_gia_tri_thuc_te(), project.getDAC(), project.getPAC(), project.getFAC(), project.getSo_tien_tam_ung(), 
				project.getKe_hoach_tam_ung(), project.getSo_tien_DAC(), project.getKe_hoach_thanh_toan_DAC(), project.getThuc_te_thanh_toan_DAC(), project.getSo_tien_PAC(), 
				project.getKe_hoach_thanh_toan_PAC(), project.getThuc_te_thanh_toan_PAC(), project.getSo_tien_FAC(), project.getKe_hoach_thanh_toan_FAC(), project.getThuc_te_thanh_toan_FAC(), 
				project.getKe_hoach(), project.getGeneral_issue(), project.getSolution(), project.getKet_qua_thuc_hien_ke_hoach(), id, _now);
	}
	
	// Tạo dụ án (Triển khai)
	public void saveDeploymentTest(Project project) {
		int week = 11;
		int year = 2022;
		String interactive = "deployment";
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, name, "
				+ "tong_gia_tri_thuc_te, tinh_trang_va_ke_hoach_chi_tiet, ket_qua_thuc_hien_ke_hoach, interactive, created_at) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), project.getProject_status(), project.getCustomer(), week, year, project.getName(), 
				project.getTong_gia_tri_thuc_te(), project.getTinh_trang_va_ke_hoach_chi_tiet(), project.getKet_qua_thuc_hien_ke_hoach(), interactive, _now);
	}
	
	public void update(Project project) {
		String sql = "UPDATE project SET project_type = ?, priority = ?, project_status = ?, "
				+ "customer = ?, week = ?, year = ?, name = ?, description = ?, "
				+ "tong_muc_dau_tu_du_kien = ?, hinh_thuc_dau_tu = ?, muc_do_kha_thi = ?, "
				+ "phan_tich_SWOT = ?, ke_hoach = ?, general_issue = ?, solution = ?, "
				+ "ket_qua_thuc_hien_ke_hoach = ?, created_at = ?, note = ? "
				+ "WHERE id = ?";
		_jdbcTemplate.update(sql, project.getProject_type(), project.getPriority(), project.getProject_status(), 
				project.getCustomer(), project.getWeek(), project.getYear(), project.getName(), 
				project.getDescription(), project.getTong_muc_dau_tu_du_kien(), project.getHinh_thuc_dau_tu(), 
				project.getMuc_do_kha_thi(), project.getPhan_tich_SWOT(), project.getKe_hoach(), 
				project.getGeneral_issue(), project.getSolution(), project.getKet_qua_thuc_hien_ke_hoach(), _now, 
				project.getNote(), project.getId());
		
	}
	
	public void updateInteractive(int id, String interactive) {
		String sql = "UPDATE project SET interactive = ? "
				+ "WHERE id = ?";
		_jdbcTemplate.update(sql, interactive, id);
		
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
	
	
	
/* ===== Đầu: Project Manager ===== */
	/* Truy vấn danh sách dữ liệu theo pic  */
	public List<DashboardProjectPicDto> getDashboardPM(int week, int year, String pic_id) {
		List<DashboardProjectPicDto> list = new ArrayList<DashboardProjectPicDto>();
		
		String sql = "SELECT project.id AS id_pk, project.week, project.year, priorities.name AS priority, projects_status.name AS status, "
				+ "project.name, customers.name AS customer, projects_types.name AS type, "
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
					+ "INNER JOIN project ON pic.project_id = project.id "
					+ "WHERE role.name = 'ROLE_AM' AND project.id = id_pk) AS am, "
				+ "project.interactive, project.tinh_trang_va_ke_hoach_chi_tiet "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN pic ON project.id =pic.project_id "
				+ "INNER JOIN users ON pic.pic = users.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "WHERE project.week = ? AND project.year = ? AND users.id = ?";
		list = _jdbcTemplate.query(sql, new DashboardProjectPicDtoMapper() {
			public DashboardProjectPicDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				DashboardProjectPicDto project = new DashboardProjectPicDto();
				project.setId_pk(rs.getInt("id_pk"));
				project.setPriority(rs.getString("priority"));
				project.setStatus(rs.getString("status"));
				project.setName(rs.getString("name"));
				project.setCustomer(rs.getString("customer"));
				project.setType(rs.getString("type"));
				project.setAm(rs.getString("am"));
				project.setPm(rs.getString("pm"));
				project.setKe_hoach(rs.getString("ke_hoach"));
				project.setWeek(rs.getInt("week"));
				project.setYear(rs.getInt("year"));
				project.setInteractive(rs.getString("interactive"));
				return project;
			}
		}, week, year, pic_id);
		return list;
	}
	
	public void update_tk(Project project) {
		String sql = "UPDATE project SET project_type = ?, priority = ?, project_status = ?, customer = ?, "
				+ "week = ?, year = ?, name = ?, projects_id = ?, ma_so_ke_toan = ?, pham_vi_cung_cap = ?, "
				+ "tong_gia_tri_thuc_te = ?, DAC = ?, PAC = ?, FAC = ?, so_tien_tam_ung = ?, ke_hoach_tam_ung = ?, "
				+ "so_tien_DAC = ?, ke_hoach_thanh_toan_DAC = ?, thuc_te_thanh_toan_DAC = ?, so_tien_PAC = ?, ke_hoach_thanh_toan_PAC = ?, "
				+ "thuc_te_thanh_toan_PAC = ?, so_tien_FAC = ?, ke_hoach_thanh_toan_FAC = ?, thuc_te_thanh_toan_FAC = ?, general_issue = ?, solution = ?, ke_hoach = ?, "
				+ "ket_qua_thuc_hien_ke_hoach = ?, created_at = ? "
				+ "WHERE id = ?";
		_jdbcTemplate.update(sql, project.getProject_type(), project.getPriority(), project.getProject_status(), 
				project.getCustomer(), project.getWeek(), project.getYear(), project.getName(), 
				project.getProject_id(), project.getMa_so_ke_toan(), project.getPham_vi_cung_cap(), 
				project.getTong_gia_tri_thuc_te(), project.getDAC(), project.getPAC(),project.getFAC(), 
				project.getSo_tien_tam_ung(), project.getKe_hoach_tam_ung(), project.getSo_tien_DAC(), 
				project.getKe_hoach_thanh_toan_DAC(), project.getThuc_te_thanh_toan_DAC(), project.getSo_tien_PAC(), project.getKe_hoach_thanh_toan_PAC(), 
				project.getThuc_te_thanh_toan_PAC(), project.getSo_tien_FAC(),project.getKe_hoach_thanh_toan_FAC(), project.getThuc_te_thanh_toan_FAC(),
				project.getGeneral_issue(), project.getSolution(), project.getKe_hoach(), project.getKet_qua_thuc_hien_ke_hoach(), _now, 
				project.getId());
	}
	
	public void saveDep(Project project) {
		String sql = "INSERT INTO project (id, project_type, priority, project_status, customer, week, year, "
				+ "ma_so_ke_toan, name, projects_id, pham_vi_cung_cap, tong_gia_tri_thuc_te, DAC, PAC, FAC, "
				+ "so_tien_tam_ung, ke_hoach_tam_ung, so_tien_DAC, ke_hoach_thanh_toan_DAC, so_tien_PAC, "
				+ "ke_hoach_thanh_toan_PAC, so_tien_FAC, ke_hoach_thanh_toan_FAC, ke_hoach, general_issue, "
				+ "solution, ket_qua_thuc_hien_ke_hoach, note, interactive, created_at) "
				+ "VALUES (?, ?, ?, ?, ?, ?, year(curdate()), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?)";
		_jdbcTemplate.update(sql, project.getId(), project.getProject_type(), project.getPriority(), 
				project.getProject_status(), project.getCustomer(), project.getWeek(), project.getMa_so_ke_toan(), 
				project.getName(), project.getProject_id(), project.getPham_vi_cung_cap(), 
				project.getTong_gia_tri_thuc_te(), project.getDAC(), project.getPAC(), project.getFAC(), 
				project.getSo_tien_tam_ung(), project.getKe_hoach_tam_ung(), project.getSo_tien_DAC(), 
				project.getKe_hoach_thanh_toan_DAC(), project.getSo_tien_PAC(), project.getKe_hoach_thanh_toan_PAC(), 
				project.getSo_tien_FAC(), project.getKe_hoach_thanh_toan_FAC(), project.getKe_hoach(), 
				project.getGeneral_issue(), project.getSolution(), project.getKet_qua_thuc_hien_ke_hoach(), 
				project.getNote(), project.getInteractive() , _now);
	}
/* ===== Cuối: Project Manager ===== */
	
/* ===== Đầu: CEO Manager ===== */
//	Lấy dữ liệu project triển khai theo id
	public Project getProjectTkById(int id) {
		Project object = new Project();
		String sql = "SELECT project.id, projects_types.id AS project_type, priorities.id AS priority, "
				+ "projects_status.id AS project_status, customers.id AS customer, project.week, "
				+ "project.year, project.name, project.projects_id AS project_id, project.ma_so_ke_toan, "
				+ "project.pham_vi_cung_cap, project.tong_gia_tri_thuc_te, project.DAC, project.PAC, "
				+ "project.FAC, project.so_tien_tam_ung, project.ke_hoach_tam_ung, project.so_tien_DAC, "
				+ "project.ke_hoach_thanh_toan_DAC, project.thuc_te_thanh_toan_DAC, project.so_tien_PAC, "
				+ "project.ke_hoach_thanh_toan_PAC, project.thuc_te_thanh_toan_PAC, project.so_tien_FAC, "
				+ "project.ke_hoach_thanh_toan_FAC, project.thuc_te_thanh_toan_FAC, "
				+ "project.tinh_trang_va_ke_hoach_chi_tiet, project.ke_hoach, project.general_issue, "
				+ "project.solution, project.ket_qua_thuc_hien_ke_hoach "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "WHERE project.id = ? LIMIT 1";
		object = _jdbcTemplate.queryForObject(sql, new ProjectDetailMoreMapper(), id);
		return object;
		
	}
	
//	Lấy dữ liệu project viễn thông hoặc chuyển đổi số theo id
	public Project getProjectById(int id){
		Project object = new Project();
		String sql = "SELECT project.id, projects_types.id AS project_type, priorities.id AS priority, "
				+ "projects_status.id AS project_status, customers.id AS customer, project.week, "
				+ "project.year, project.name, project.description, project.tong_muc_dau_tu_du_kien, "
				+ "project.hinh_thuc_dau_tu, project.muc_do_kha_thi, project.phan_tich_SWOT, "
				+ "project.ke_hoach, project.general_issue, project.solution, "
				+ "project.ket_qua_thuc_hien_ke_hoach, project.note "
				+ "FROM project "
				+ "INNER JOIN projects_types ON project.project_type = projects_types.id "
				+ "INNER JOIN priorities ON project.priority = priorities.id "
				+ "INNER JOIN projects_status ON project.project_status = projects_status.id "
				+ "INNER JOIN customers ON project.customer = customers.id "
				+ "INNER JOIN pic ON project.id = pic.project_id "
				+ "WHERE project.id = ?";
		
		object = _jdbcTemplate.queryForObject(sql, new ProjectDetailLessMapper(), id);
		return object;
		
	}
	
/* ===== Cuối: CEO Manager ===== */

}
