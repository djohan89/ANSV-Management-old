package vn.ansv.Dto;

import java.sql.Date;

public class ProjectDetailDto {
	private int id;
	private int customer_id;
	private String type;
	private String priority;
	private String pic_id;
	private String pic_name;
	private String status;
	private String customer;
	private String name;
	private String pic_role;
	private String tinh_trang_va_ke_hoach_chi_tiet;
	private String ket_qua_thuc_hien_ke_hoach;
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
	private double so_tien_PAC;
	private Date ke_hoach_thanh_toan_PAC;
	private double so_tien_FAC;
	private Date ke_hoach_thanh_toan_FAC;
	private String note;
	private int week;
	
	public ProjectDetailDto() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
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

	public String getPic_id() {
		return pic_id;
	}

	public void setPic_id(String pic_id) {
		this.pic_id = pic_id;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic_role() {
		return pic_role;
	}

	public void setPic_role(String pic_role) {
		this.pic_role = pic_role;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	
}
