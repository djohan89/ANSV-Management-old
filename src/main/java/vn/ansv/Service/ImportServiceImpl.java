package vn.ansv.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.CustomersDao;
import vn.ansv.Dao.PicDao;
import vn.ansv.Dao.PriorityDao;
import vn.ansv.Dao.ProjectDao;
import vn.ansv.Dto.Import.ProjectImport;
import vn.ansv.Entity.Project;

@Service
public class ImportServiceImpl {

	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CustomersDao customersDao;
	
	@Autowired
	private PriorityDao priorityDao;
	
	@Autowired
	private PicDao picDao;
	
	public String date_diff(Date muc_tieu, Date thuc_te, boolean st) {
		
		Calendar set_now = Calendar.getInstance();
		
		LocalDate localDate = LocalDate.now();
		set_now.set(Calendar.DATE, localDate.getDayOfMonth());
		set_now.set(Calendar.MONTH, localDate.getMonthValue() - 1);
		set_now.set(Calendar.YEAR, localDate.getYear());
		
		String result = "";
		long diff = 0;
		long diffDays = 0;
		
		if (muc_tieu != null) {
			if (thuc_te != null) {
				diff = muc_tieu.getTime() - thuc_te.getTime();
			} else {
				diff = muc_tieu.getTime() - set_now.getTimeInMillis();
			}
			diffDays = diff / (24 * 60 * 60 * 1000);
			
			if (diffDays < 0 && st == false) {
				result = "<font color='red'>" + diffDays + "</font>";
			} else {
				result = "" + diffDays;
			}
			
		}
		
		return result;
	}
	
	// Chuyển đổi date (excel) thành date (String) => import date (sql)
	public Date dateSql(String input_date) {
		if (input_date == null) {
			return null;
		}
		
		String sub_day = input_date.substring(0,2);
		String sub_month = input_date.substring(5,7);
		String sub_year = input_date.substring(10,14);
		String result = sub_year + "-" + sub_month + "-" + sub_day;
		System.out.println("dateSql result: " + result);
		
	   	return Date.valueOf(result);
	}
	
	// Lấy ngày hiện tại format YYYY/mm/dd
	public String dateNow() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now));
		
	   	return dtf.format(now);
	}
	
	// Kiểm tra giá trị có phải số hay không
	private static boolean isNumeric(String str){
        return str != null && str.matches("[0-9.]+");
    }
	
	// Tạo lập mảng chứa dữ liệu key => Import dự án Viễn thông / Chuyển đổi số
	public String[] key_array_1() {
		String[] key_array_1; // Mảng chứa dữ liệu key
		key_array_1 = new String[18]; // Khoảng giá trị của mảng
		key_array_1[0] = "stt";
		key_array_1[1] = "name";
		key_array_1[2] = "customer";
		key_array_1[3] = "description";
		key_array_1[4] = "hinh_thuc_dau_tu";
		key_array_1[5] = "tong_muc_dau_tu_du_kien";
		key_array_1[6] = "muc_do_kha_thi";
		key_array_1[7] = "phan_tich_SWOOT";
		key_array_1[8] = "general_issue";
		key_array_1[9] = "solution";
		key_array_1[10] = "priority";
		key_array_1[11] = "project_status";
		key_array_1[12] = "pic_name";
		key_array_1[13] = "main_manager";
		key_array_1[14] = "ket_qua_tuan_truoc";
		key_array_1[15] = "ket_qua_tuan_nay";
		key_array_1[16] = "ke_hoach_tuan_nay";
		key_array_1[17] = "ke_hoach_tuan_sau";
		
		return key_array_1;
	}
	
	// Tạo lập mảng chứa dữ liệu key => Import dự án Triển khai
	public String[] key_array_2() {
		String[] key_array_2; // Mảng chứa dữ liệu key
		key_array_2 = new String[33]; // Khoảng giá trị của mảng
		key_array_2[0] = "stt";
		key_array_2[1] = "name";
		key_array_2[2] = "projects_id";
		key_array_2[3] = "ma_so_ke_toan";
		key_array_2[4] = "customer";
		key_array_2[5] = "tong_gia_tri_thuc_te";
		key_array_2[6] = "so_tien_DAC";
		key_array_2[7] = "DAC";
		key_array_2[8] = "ke_hoach_thanh_toan_DAC";
		key_array_2[9] = "thuc_te_thanh_toan_DAC";
		key_array_2[10] = "so_ngay_con_lai_DAC";
		key_array_2[11] = "so_tien_PAC";
		key_array_2[12] = "PAC";
		key_array_2[13] = "ke_hoach_thanh_toan_PAC";
		key_array_2[14] = "thuc_te_thanh_toan_PAC";
		key_array_2[15] = "so_ngay_con_lai_PAC";
		key_array_2[16] = "so_tien_FAC";
		key_array_2[17] = "FAC";
		key_array_2[18] = "ke_hoach_thanh_toan_FAC";
		key_array_2[19] = "thuc_te_thanh_toan_FAC";
		key_array_2[20] = "so_ngay_con_lai_FAC";
		key_array_2[21] = "pham_vi_cung_cap";
		key_array_2[22] = "general_issue";
		key_array_2[23] = "solution";
		key_array_2[24] = "priority";
		key_array_2[25] = "project_status";
		key_array_2[26] = "am";
		key_array_2[27] = "pic_name";
		key_array_2[28] = "main_manager";
		key_array_2[29] = "ket_qua_tuan_truoc";
		key_array_2[30] = "ket_qua_tuan_nay";
		key_array_2[31] = "ke_hoach_tuan_nay";
		key_array_2[32] = "ke_hoach_tuan_sau";
		
		return key_array_2;
	}
	
	public int checkManagerIssets(JSONObject json_import) {
		int manager_issets = 0;
		String main_manager = (String)json_import.get("main_manager");
		int checkManagerIssets = picDao.checkUsersIssets(main_manager);
		
		// Kiểm tra người giám sát
		if (main_manager != null && checkManagerIssets == 0) {
			manager_issets = 1;
		}
		
		return manager_issets;
	}
	
	public String import_status(JSONObject json_import, int type_import) {
		String import_status = null;
		
		String customer_name = "", priority_name = "", status_name = "", pic_name = "", muc_do_kha_thi = "";
		int checkCustomerIssets = 0, checkPriorityIssets = 0, checkStatusIssets = 0, checkPicIssets = 0;
		
		// Trích xuất dữ liệu JSON (một số dữ liệu cần)
		customer_name = (String)json_import.get("customer");
		priority_name = (String)json_import.get("priority");
		status_name = (String)json_import.get("project_status");
		pic_name = (String)json_import.get("pic_name");
		
		// Kiểm tra dữ liệu quan hệ
		checkCustomerIssets = customersDao.checkIssets(customer_name);
		checkPriorityIssets = priorityDao.checkPriorityIssets(priority_name);
		checkStatusIssets = priorityDao.checkStatusIssets(status_name);
		checkPicIssets = picDao.checkUsersIssets(pic_name);
		
		// Kiểm tra PIC
		if (pic_name == null) {
			import_status += "pic NULL - ";
		} else if (checkPicIssets == 0) {
			import_status += "pic error - ";
		}
		
		// Kiểm tra khách hàng
		if (customer_name == null) {
			import_status += "customer NULL - ";
		} else if (checkCustomerIssets == 0) {
			import_status += "customer error - ";
		}
		
		// Kiểm tra mức độ ưu tiên
		if (priority_name == null) {
			import_status += "priority NULL - ";
		} else if (checkPriorityIssets == 0) {
			import_status += "priority error - ";
		}
		
		// Kiểm tra mức độ tình trạng
		if (status_name == null) {
			import_status += "status NULL - ";
		} else if (checkStatusIssets == 0) {
			import_status += "status error - ";
		}
		
		if (type_import != 1) {
			// Kiểm tra mức độ khả thi
			muc_do_kha_thi = json_import.get("muc_do_kha_thi") + "";
			if (isNumeric(muc_do_kha_thi) == false) {
				import_status += "muc_do_kha_thi error - ";
			}
		}
		
		return import_status;
	}
	
	
	
	// Thực hiện Import dự án từ file excel vào database
	public String importProject(String file_name, int week) throws IOException {
		String result_status = "Lỗi! Không thể thực hiện import.";
		
		String interactive = "old";
		// String file_name = "Bao cao KD Vien thong tuan 1 thang 4 nam 2022.xlsx";
		
		int week_import = 17; // Week option
		int type_import = 0;
		
		File myFile = new File("D://test/" + file_name); 
		FileInputStream fis = new FileInputStream(myFile); 
		
		// Kiểm tra loại dự án
		if (file_name.contains("Trien khai")) {
			type_import = 1;
		}
		if (file_name.contains("Vien thong")) {
			type_import = 2;
		}
		if (file_name.contains("Chuyen doi so")) {
			type_import = 3;
		}
		
		// Finds the workbook instance for XLSX file 
		XSSFWorkbook myWorkBook = new XSSFWorkbook (fis); 
		
		// Return first sheet from the XLSX workbook 
		XSSFSheet mySheet = myWorkBook.getSheetAt(0); 
		
		// Get iterator to all the rows in current sheet 
		Iterator<Row> rowIterator = mySheet.iterator();

		String[] key_array;
		
		String project_name = "", customer_name = "", priority_name = "", status_name = "", am_name = "", pic_name = "", muc_do_kha_thi = "";
		int project_id = 0, checkProjectIssets = 0, import_start = 0;
		
		// Traversing over each row of XLSX file 
		while (rowIterator.hasNext()) { 
			import_start++;
			Row row = rowIterator.next();
			
			if (import_start > 1) {
				int count = 0;
				// For each row, iterate through each columns 
				Iterator<Cell> cellIterator = row.cellIterator(); 
				JSONObject json_import = new JSONObject();
				
				if (type_import == 1) {
					key_array = key_array_2(); // Mảng key của dự án Triển khai
				} else if (type_import == 2 || type_import == 3) {
					key_array = key_array_1(); // Mảng key của dự án Viễn thông / Chuyển đổi số
				} else {
					return "Lỗi! Không thể xác định loại dự án.";
				}
				
				while (cellIterator.hasNext()) { 
					Cell cell = cellIterator.next(); 
					
					switch (cell.getCellType()) { 
						case Cell.CELL_TYPE_STRING: 
							json_import.put(key_array[count], cell.getStringCellValue());
//							System.out.print(cell.getStringCellValue() + "\t"); 
//							System.out.println(count);
							break; 
						case Cell.CELL_TYPE_NUMERIC: 
							json_import.put(key_array[count], cell.getNumericCellValue());
//							System.out.print(cell.getNumericCellValue() + "\t"); 
//							System.out.println(count);
							break; 
						case Cell.CELL_TYPE_BOOLEAN: 
							json_import.put(key_array[count], cell.getBooleanCellValue());
//							System.out.print(cell.getBooleanCellValue() + "\t"); 
//							System.out.println(count);
							break; 
						default : 
							// code block
					} 
					
//					if (count == 6) {
//					} else {
//						switch (cell.getCellType()) { 
//							case Cell.CELL_TYPE_STRING: 
//								System.out.print(cell.getStringCellValue() + "\t"); 
//								map.put(key_array_1[count], cell.getStringCellValue());
//								System.out.println(count);
//								break; 
//							case Cell.CELL_TYPE_NUMERIC: 
//								System.out.print(cell.getNumericCellValue() + "\t"); 
//								map.put(key_array_1[count], cell.getNumericCellValue() + "");
//								System.out.println(count);
//								break; 
//							case Cell.CELL_TYPE_BOOLEAN: 
//								System.out.print(cell.getBooleanCellValue() + "\t"); 
//								map.put(key_array_1[count], cell.getBooleanCellValue() + "");
//								System.out.println(count);
//								break; 
//							default : 
//								// code block
//						} 
//					}
					
					count++;
				} 
				System.out.println("Chuoi JSON DAC: " + json_import.get("ke_hoach_thanh_toan_FAC"));
				
				// Trích xuất dữ liệu JSON (một số dữ liệu cần)
				project_name = (String)json_import.get("name");
				System.out.println("project_name: " + project_name);
				customer_name = (String)json_import.get("customer");
				priority_name = (String)json_import.get("priority");
				status_name = (String)json_import.get("project_status");
				am_name = (String)json_import.get("am");
				pic_name = (String)json_import.get("pic_name");
				
				Date DAC = dateSql((String)json_import.get("DAC"));
				Date PAC = dateSql((String)json_import.get("PAC"));
				Date FAC = dateSql((String)json_import.get("FAC"));
				
				Date ke_hoach_thanh_toan_DAC = dateSql((String)json_import.get("ke_hoach_thanh_toan_DAC"));
				Date ke_hoach_thanh_toan_PAC = dateSql((String)json_import.get("ke_hoach_thanh_toan_PAC"));
				Date ke_hoach_thanh_toan_FAC = dateSql((String)json_import.get("ke_hoach_thanh_toan_FAC"));
				
				Date thuc_te_thanh_toan_DAC = dateSql((String)json_import.get("thuc_te_thanh_toan_DAC"));
				Date thuc_te_thanh_toan_PAC = dateSql((String)json_import.get("thuc_te_thanh_toan_PAC"));
				Date thuc_te_thanh_toan_FAC = dateSql((String)json_import.get("thuc_te_thanh_toan_FAC"));
				
				Double so_tien_DAC = null, so_tien_PAC = null, so_tien_FAC = null;
				
				
				
				String import_status = import_status(json_import, type_import); // Gọi hàm kiểm tra dữ liệu trước khi Import
				int manager_issets = checkManagerIssets(json_import); // Gọi hàm kiểm tra người giám sát dự án
				
				project_name = (String)json_import.get("name");
				checkProjectIssets = projectDao.checkIssetsProject(project_name); // Kiểm tra dữ liệu quan hệ
				muc_do_kha_thi = json_import.get("muc_do_kha_thi") + "";
				
				System.out.println("import_status: " + import_status);
				
				if (project_name != null && import_status == null && type_import != 0) {
					if (checkProjectIssets != 0) {
						project_id = projectDao.getIdByName(project_name);
						projectDao.updateInteractive(project_id, interactive);
					}
					
					// Truy xuất dữ liệu quan hệ
					project_id = projectDao.getMaxId() + 1;
					int customer_id = customersDao.getIdByName(customer_name);
					int priority_id = priorityDao.getPriorityIdByName(priority_name);
					int status_id = priorityDao.getStatusIdByName(status_name);
					String pic_id = picDao.getIdByName(pic_name);
					
					System.out.println("type_import: " + type_import);
					// Kiểm tra loại dự án => Import
					if (type_import == 1) {
						String am_id = picDao.getIdByName(am_name);
						System.out.print("type_import is 1");
						// Dự án Triển khai
						Project project = new Project();
						project.setId(project_id);
						project.setProject_type(type_import);
						project.setPriority(priority_id);
						project.setProject_status(status_id);
						project.setCustomer(customer_id);
						project.setWeek(week);
						project.setMa_so_ke_toan((String) json_import.get("ma_so_ke_toan"));
						project.setName(project_name);
						project.setProject_id((String) json_import.get("projects_id"));
						project.setPham_vi_cung_cap((String) json_import.get("pham_vi_cung_cap"));
						project.setTong_gia_tri_thuc_te(Double.valueOf(json_import.get("tong_gia_tri_thuc_te").toString()).doubleValue());
						project.setDAC(DAC);
						project.setPAC(PAC);
						project.setFAC(FAC);
//						project.setSo_tien_tam_ung();
//						project.setKe_hoach_tam_ung();
						if (json_import.get("so_tien_DAC") != null) {
							so_tien_DAC = Double.valueOf(json_import.get("so_tien_DAC").toString()).doubleValue();
							project.setSo_tien_DAC(so_tien_DAC);
						}
						project.setKe_hoach_thanh_toan_DAC(ke_hoach_thanh_toan_DAC);
						project.setThuc_te_thanh_toan_DAC(thuc_te_thanh_toan_DAC);
						if (json_import.get("so_tien_PAC") != null) {
							so_tien_PAC = Double.valueOf(json_import.get("so_tien_PAC").toString()).doubleValue();
							project.setSo_tien_PAC(so_tien_PAC);
						}
						project.setKe_hoach_thanh_toan_PAC(ke_hoach_thanh_toan_PAC);
						project.setThuc_te_thanh_toan_PAC(thuc_te_thanh_toan_PAC);
						if (json_import.get("so_tien_FAC") != null) {
							so_tien_FAC = Double.valueOf(json_import.get("so_tien_FAC").toString()).doubleValue();
							project.setSo_tien_PAC(so_tien_FAC);
						}
						project.setKe_hoach_thanh_toan_FAC(ke_hoach_thanh_toan_FAC);
						project.setThuc_te_thanh_toan_FAC(thuc_te_thanh_toan_FAC);
						project.setKe_hoach((String) json_import.get("ke_hoach_tuan_nay"));
						project.setGeneral_issue((String) json_import.get("general_issue"));
						project.setSolution((String) json_import.get("solution"));
						project.setKet_qua_thuc_hien_ke_hoach((String) json_import.get("ket_qua_tuan_truoc"));
						project.setNote("imported on " + dateNow());
						project.setInteractive("deployment");
						
						System.out.print("set mapper success");
						
						projectDao.saveDep(project); // Insert dữ liệu dự án mới
						System.out.print("save project success");
						picDao.save(project_id, am_id); // Insert Acount Manager (người tạo dự án)
						System.out.print("save AM success");
						picDao.save(project_id, pic_id); // Insert PIC tương ứng của dự án
						System.out.print("save PM success");
						
						result_status = "Import chuỗi dự án Triển khai. Thành công!";
					} else {
						// Dự án Viễn thông / Chuyển đổi số
						Project project = new Project();
						project.setId(project_id);
						project.setProject_type(type_import);
						project.setPriority(priority_id);
						project.setProject_status(status_id);
						project.setCustomer(customer_id);
						project.setWeek(week);
						project.setName(project_name);
						project.setDescription((String) json_import.get("description"));
						project.setTong_muc_dau_tu_du_kien((String) json_import.get("tong_muc_dau_tu_du_kien"));
						project.setHinh_thuc_dau_tu((String) json_import.get("hinh_thuc_dau_tu"));
						project.setMuc_do_kha_thi((int) Double.parseDouble(muc_do_kha_thi));
						project.setPhan_tich_SWOT((String) json_import.get("phan_tich_SWOOT"));
						project.setKe_hoach((String) json_import.get("ke_hoach_tuan_nay"));
						project.setGeneral_issue((String) json_import.get("general_issue"));
						project.setSolution((String) json_import.get("solution"));
						project.setKet_qua_thuc_hien_ke_hoach((String) json_import.get("ket_qua_tuan_nay"));
						project.setNote("imported on " + dateNow());
						project.setInteractive("create");
						
						projectDao.save(project); // Insert dữ liệu dự án mới
						picDao.save(project_id, pic_id); // Insert PIC tương ứng của dự án

						result_status += project_id + " - import success";
					}
				} else {
					System.out.println("Thông tin ko chính xác!");
				}
			} else {
				System.out.println(import_start + "Tieu de file.");
			}
		}
		
		return result_status;
	}
	
	
	
	// Trích xuất dữ liệu => Export 
	public String exportProject(int week, int type_export) {
		String result_status = "Export error!";
		
		List<ProjectImport> list = new ArrayList<ProjectImport>();
		list = projectDao.getExport(week, type_export);
		
		JSONObject json_import = new JSONObject();
		JSONArray json_array = new JSONArray();
		String[] key_array;
		if (type_export == 1) {
			key_array = key_array_2(); // Mảng key của dự án Triển khai
			
			json_import.put("error_code", 0);
			json_import.put("fileType", "Triển khai");
			json_import.put("fileTypeCode", 0);
			json_import.put("err_desc", null);
			boolean st = false;
			for (int i = 0; i < list.size(); i++) {
				// Kiểm tra dự án đã "Complete" hay chưa
				st = list.get(i).getStatus().contains("Complete");
				
				// Tính toán chênh lệch thời gian DAC
				String a = date_diff(list.get(i).getKe_hoach_thanh_toan_DAC(), list.get(i).getThuc_te_thanh_toan_DAC(), st);
				list.get(i).setChenh_lech_DAC(a);
				
				// Tính toán chênh lệch thời gian PAC
				String b = date_diff(list.get(i).getKe_hoach_thanh_toan_PAC(), list.get(i).getThuc_te_thanh_toan_PAC(), st);
				list.get(i).setChenh_lech_PAC(b);
				
				// Tính toán chênh lệch thời gian FAC
				String c = date_diff(list.get(i).getKe_hoach_thanh_toan_FAC(), list.get(i).getThuc_te_thanh_toan_FAC(), st);
				list.get(i).setChenh_lech_FAC(c);
				
				JSONObject item_import = new JSONObject();
				item_import.put("stt", i++);
				item_import.put("duan", list.get(i).getName());
				item_import.put("sohopdong", list.get(i).getProjects_id());
				item_import.put("masoketoan", list.get(i).getMa_so_ke_toan());
				item_import.put("khachhang", list.get(i).getCustomer());
				item_import.put("gatri", list.get(i).getTong_gia_tri_thuc_te());
				item_import.put("sotiendac", list.get(i).getSo_tien_DAC());
				item_import.put("dachopdong", list.get(i).getDAC());
				item_import.put("muctieudac", list.get(i).getKe_hoach_thanh_toan_DAC());
				item_import.put("dacthucte", list.get(i).getThuc_te_thanh_toan_DAC());
				item_import.put("songayconlaidac", list.get(i).getChenh_lech_DAC()); // Chưa cập nhật
	
				item_import.put("sotienpac", list.get(i).getSo_tien_PAC());
				item_import.put("pachopdong", list.get(i).getPAC());
				item_import.put("muctieupac", list.get(i).getKe_hoach_thanh_toan_PAC());
				item_import.put("pacthucte", list.get(i).getThuc_te_thanh_toan_PAC());
				item_import.put("songayconlaipac", list.get(i).getChenh_lech_PAC()); // Chưa cập nhật
				
				item_import.put("sotienfac", list.get(i).getSo_tien_FAC());
				item_import.put("fachopdong", list.get(i).getFAC());
				item_import.put("muctieufac", list.get(i).getKe_hoach_thanh_toan_FAC());
				item_import.put("facthucte", list.get(i).getThuc_te_thanh_toan_FAC());
				item_import.put("songayconlaifac", list.get(i).getChenh_lech_FAC()); // Chưa cập nhật
				
				item_import.put("tiendochung", list.get(i).getPham_vi_cung_cap());
				item_import.put("khokhan", list.get(i).getGeneral_issue());
				item_import.put("giaiphap", list.get(i).getSolution());
				item_import.put("priority", list.get(i).getPriority());
				item_import.put("status", list.get(i).getStatus());
				
				item_import.put("am", picDao.getAllPicByProjectAndRole(list.get(i).getId(), "ROLE_AM"));
				item_import.put("pm", picDao.getAllPicByProjectAndRole(list.get(i).getId(), "ROLE_PM"));
				item_import.put("phoban", ""); // Chưa cập nhật
				
				item_import.put("ketquathuchientuantruoc", list.get(i).getKet_qua_thuc_hien_ke_hoach());
				item_import.put("ketquathuchientuannay", "");
				item_import.put("kehoachtuannay", list.get(i).getKe_hoach());
				item_import.put("kehoachtuansau", "");
				
				json_array.add(item_import);
			}
			json_import.put("data", json_array);
			
			System.out.println("json_import: " + json_import);
		} else if (type_export == 2 || type_export == 3) {
			key_array = key_array_1(); // Mảng key của dự án Viễn thông / Chuyển đổi số
		} else {
			return json_import.toString();
		}
		
		return json_import.toString();
	}
	
}
