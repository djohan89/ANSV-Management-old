package vn.ansv.Dto;

public class DashboardProjectPicDto {
	private int id_pk;
	private String priority;
	private String status;
	private String name;
	private String customer;
	private String type;
	private String am;
	private String pm;
	private String tinh_trang_va_ke_hoach_chi_tiet;
	private int week;
	private int year;

	public DashboardProjectPicDto() {
		super();
	}

	public int getId_pk() {
		return id_pk;
	}

	public void setId_pk(int id_pk) {
		this.id_pk = id_pk;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAm() {
		return am;
	}

	public void setAm(String am) {
		this.am = am;
	}

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getTinh_trang_va_ke_hoach_chi_tiet() {
		return tinh_trang_va_ke_hoach_chi_tiet;
	}

	public void setTinh_trang_va_ke_hoach_chi_tiet(String tinh_trang_va_ke_hoach_chi_tiet) {
		this.tinh_trang_va_ke_hoach_chi_tiet = tinh_trang_va_ke_hoach_chi_tiet;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	
}
