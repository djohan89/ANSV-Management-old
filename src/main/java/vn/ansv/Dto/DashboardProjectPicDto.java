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
	private String ke_hoach;
	private int week;
	private int year;
	private String note;
	private String interactive;

	

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

	public String getKe_hoach() {
		return ke_hoach;
	}

	public void setKe_hoach(String ke_hoach) {
		this.ke_hoach = ke_hoach;
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
	
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	public String getInteractive() {
		return interactive;
	}

	public void setInteractive(String interactive) {
		this.interactive = interactive;
	}
	
}
