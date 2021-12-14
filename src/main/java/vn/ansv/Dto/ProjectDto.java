package vn.ansv.Dto;

public class ProjectDto {
	
	private int id;
	private String pic;
	private String project_type;
	private String priority;
	private String project_status;
	private String customer;
	private String project_id;
	private String project_name;
	private String tinh_trang_va_ke_hoach_chi_tiet;
	private String ket_qua_thuc_hien_ke_hoach;
	private int week;
	
	public ProjectDto() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getProject_type() {
		return project_type;
	}

	public void setProject_type(String project_type) {
		this.project_type = project_type;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getProject_status() {
		return project_status;
	}

	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getTinh_trang_va_ke_hoach_chi_tiet() {
		return tinh_trang_va_ke_hoach_chi_tiet;
	}

	public void setTinh_trang_va_ke_hoach_chi_tiet(String tinh_trang_va_ke_hoach_chi_tiet) {
		this.tinh_trang_va_ke_hoach_chi_tiet = tinh_trang_va_ke_hoach_chi_tiet;
	}

	public String getKet_qua_thuc_hien_ke_hoach() {
		return ket_qua_thuc_hien_ke_hoach;
	}

	public void setKet_qua_thuc_hien_ke_hoach(String ket_qua_thuc_hien_ke_hoach) {
		this.ket_qua_thuc_hien_ke_hoach = ket_qua_thuc_hien_ke_hoach;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

}
