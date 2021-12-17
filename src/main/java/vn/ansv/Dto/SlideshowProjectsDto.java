package vn.ansv.Dto;

import java.sql.Date;

public class SlideshowProjectsDto {

	private int id_pk;
	private int week;
	private String priority;
	private String status;
	private String name;
	
	private String customer;
	private String pm;
	private String am;
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
	
	private String ket_qua_thuc_hien_ke_hoach;
	private String tinh_trang_va_ke_hoach_chi_tiet;
	
	public SlideshowProjectsDto() {
		super();
	}

	public int getId_pk() {
		return id_pk;
	}

	public void setId_pk(int id_pk) {
		this.id_pk = id_pk;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
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

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getAm() {
		return am;
	}

	public void setAm(String am) {
		this.am = am;
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

	public String getKet_qua_thuc_hien_ke_hoach() {
		return ket_qua_thuc_hien_ke_hoach;
	}

	public void setKet_qua_thuc_hien_ke_hoach(String ket_qua_thuc_hien_ke_hoach) {
		this.ket_qua_thuc_hien_ke_hoach = ket_qua_thuc_hien_ke_hoach;
	}

	public String getTinh_trang_va_ke_hoach_chi_tiet() {
		return tinh_trang_va_ke_hoach_chi_tiet;
	}

	public void setTinh_trang_va_ke_hoach_chi_tiet(String tinh_trang_va_ke_hoach_chi_tiet) {
		this.tinh_trang_va_ke_hoach_chi_tiet = tinh_trang_va_ke_hoach_chi_tiet;
	}
	
}
