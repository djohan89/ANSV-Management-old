package vn.ansv.Dto.Import;

import java.sql.Date;

public class ProjectImport {

	private int id;
	private int type_id;
	private String type;
	private String priority;
	private String status;
	
	private String customer;
	private int week;
	private int year;
	private String projects_id;
	private String ma_so_ke_toan;
	private String name;
	private String description;
	
	private String tong_muc_dau_tu_du_kien;
	private String hinh_thuc_dau_tu;
	private int muc_do_kha_thi;
	private String phan_tich_SWOT;
	private String pham_vi_cung_cap;
	private double tong_gia_tri_thuc_te;
	
	private Date DAC;
	private Date PAC;
	private Date FAC;
	private double so_tien_tam_ung;
	private Date ke_hoach_tam_ung;
	
	private double so_tien_DAC;
	private Date ke_hoach_thanh_toan_DAC;
	private Date thuc_te_thanh_toan_DAC;
	private String chenh_lech_DAC;
	
	private double so_tien_PAC;
	private Date ke_hoach_thanh_toan_PAC;
	private Date thuc_te_thanh_toan_PAC;
	private String chenh_lech_PAC;
	
	private double so_tien_FAC;
	private Date ke_hoach_thanh_toan_FAC;
	private Date thuc_te_thanh_toan_FAC;
	private String chenh_lech_FAC;
	
	private String ke_hoach;
	private String general_issue;
	private String solution;
	private String ket_qua_thuc_hien_ke_hoach;
	private String note;
	private String interactive;
	
	private String am_name;
	private String pic_name;
	private String manager_name;

	public ProjectImport() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
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

	public String getProjects_id() {
		return projects_id;
	}

	public void setProjects_id(String projects_id) {
		this.projects_id = projects_id;
	}

	public String getMa_so_ke_toan() {
		return ma_so_ke_toan;
	}

	public void setMa_so_ke_toan(String ma_so_ke_toan) {
		this.ma_so_ke_toan = ma_so_ke_toan;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTong_muc_dau_tu_du_kien() {
		return tong_muc_dau_tu_du_kien;
	}

	public void setTong_muc_dau_tu_du_kien(String tong_muc_dau_tu_du_kien) {
		this.tong_muc_dau_tu_du_kien = tong_muc_dau_tu_du_kien;
	}

	public String getHinh_thuc_dau_tu() {
		return hinh_thuc_dau_tu;
	}

	public void setHinh_thuc_dau_tu(String hinh_thuc_dau_tu) {
		this.hinh_thuc_dau_tu = hinh_thuc_dau_tu;
	}

	public int getMuc_do_kha_thi() {
		return muc_do_kha_thi;
	}

	public void setMuc_do_kha_thi(int muc_do_kha_thi) {
		this.muc_do_kha_thi = muc_do_kha_thi;
	}

	public String getPhan_tich_SWOT() {
		return phan_tich_SWOT;
	}

	public void setPhan_tich_SWOT(String phan_tich_SWOT) {
		this.phan_tich_SWOT = phan_tich_SWOT;
	}

	public String getPham_vi_cung_cap() {
		return pham_vi_cung_cap;
	}

	public void setPham_vi_cung_cap(String pham_vi_cung_cap) {
		this.pham_vi_cung_cap = pham_vi_cung_cap;
	}

	public double getTong_gia_tri_thuc_te() {
		return tong_gia_tri_thuc_te;
	}

	public void setTong_gia_tri_thuc_te(double tong_gia_tri_thuc_te) {
		this.tong_gia_tri_thuc_te = tong_gia_tri_thuc_te;
	}

	public Date getDAC() {
		return DAC;
	}

	public void setDAC(Date dAC) {
		DAC = dAC;
	}

	public Date getPAC() {
		return PAC;
	}

	public void setPAC(Date pAC) {
		PAC = pAC;
	}

	public Date getFAC() {
		return FAC;
	}

	public void setFAC(Date fAC) {
		FAC = fAC;
	}

	public double getSo_tien_tam_ung() {
		return so_tien_tam_ung;
	}

	public void setSo_tien_tam_ung(double so_tien_tam_ung) {
		this.so_tien_tam_ung = so_tien_tam_ung;
	}

	public Date getKe_hoach_tam_ung() {
		return ke_hoach_tam_ung;
	}

	public void setKe_hoach_tam_ung(Date ke_hoach_tam_ung) {
		this.ke_hoach_tam_ung = ke_hoach_tam_ung;
	}

	public double getSo_tien_DAC() {
		return so_tien_DAC;
	}

	public void setSo_tien_DAC(double so_tien_DAC) {
		this.so_tien_DAC = so_tien_DAC;
	}

	public Date getKe_hoach_thanh_toan_DAC() {
		return ke_hoach_thanh_toan_DAC;
	}

	public void setKe_hoach_thanh_toan_DAC(Date ke_hoach_thanh_toan_DAC) {
		this.ke_hoach_thanh_toan_DAC = ke_hoach_thanh_toan_DAC;
	}

	public Date getThuc_te_thanh_toan_DAC() {
		return thuc_te_thanh_toan_DAC;
	}

	public void setThuc_te_thanh_toan_DAC(Date thuc_te_thanh_toan_DAC) {
		this.thuc_te_thanh_toan_DAC = thuc_te_thanh_toan_DAC;
	}

	public String getChenh_lech_DAC() {
		return chenh_lech_DAC;
	}

	public void setChenh_lech_DAC(String chenh_lech_DAC) {
		this.chenh_lech_DAC = chenh_lech_DAC;
	}

	public double getSo_tien_PAC() {
		return so_tien_PAC;
	}

	public void setSo_tien_PAC(double so_tien_PAC) {
		this.so_tien_PAC = so_tien_PAC;
	}

	public Date getKe_hoach_thanh_toan_PAC() {
		return ke_hoach_thanh_toan_PAC;
	}

	public void setKe_hoach_thanh_toan_PAC(Date ke_hoach_thanh_toan_PAC) {
		this.ke_hoach_thanh_toan_PAC = ke_hoach_thanh_toan_PAC;
	}

	public Date getThuc_te_thanh_toan_PAC() {
		return thuc_te_thanh_toan_PAC;
	}

	public void setThuc_te_thanh_toan_PAC(Date thuc_te_thanh_toan_PAC) {
		this.thuc_te_thanh_toan_PAC = thuc_te_thanh_toan_PAC;
	}

	public String getChenh_lech_PAC() {
		return chenh_lech_PAC;
	}

	public void setChenh_lech_PAC(String chenh_lech_PAC) {
		this.chenh_lech_PAC = chenh_lech_PAC;
	}

	public double getSo_tien_FAC() {
		return so_tien_FAC;
	}

	public void setSo_tien_FAC(double so_tien_FAC) {
		this.so_tien_FAC = so_tien_FAC;
	}

	public Date getKe_hoach_thanh_toan_FAC() {
		return ke_hoach_thanh_toan_FAC;
	}

	public void setKe_hoach_thanh_toan_FAC(Date ke_hoach_thanh_toan_FAC) {
		this.ke_hoach_thanh_toan_FAC = ke_hoach_thanh_toan_FAC;
	}

	public Date getThuc_te_thanh_toan_FAC() {
		return thuc_te_thanh_toan_FAC;
	}

	public void setThuc_te_thanh_toan_FAC(Date thuc_te_thanh_toan_FAC) {
		this.thuc_te_thanh_toan_FAC = thuc_te_thanh_toan_FAC;
	}

	public String getChenh_lech_FAC() {
		return chenh_lech_FAC;
	}

	public void setChenh_lech_FAC(String chenh_lech_FAC) {
		this.chenh_lech_FAC = chenh_lech_FAC;
	}

	public String getKe_hoach() {
		return ke_hoach;
	}

	public void setKe_hoach(String ke_hoach) {
		this.ke_hoach = ke_hoach;
	}

	public String getGeneral_issue() {
		return general_issue;
	}

	public void setGeneral_issue(String general_issue) {
		this.general_issue = general_issue;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getKet_qua_thuc_hien_ke_hoach() {
		return ket_qua_thuc_hien_ke_hoach;
	}

	public void setKet_qua_thuc_hien_ke_hoach(String ket_qua_thuc_hien_ke_hoach) {
		this.ket_qua_thuc_hien_ke_hoach = ket_qua_thuc_hien_ke_hoach;
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

	public String getAm_name() {
		return am_name;
	}

	public void setAm_name(String am_name) {
		this.am_name = am_name;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	
}
