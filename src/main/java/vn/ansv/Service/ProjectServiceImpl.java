package vn.ansv.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.ProjectDao;
import vn.ansv.Dto.DashboardProjectDto;
import vn.ansv.Dto.DashboardProjectPicDto;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.ProjectStatisticsDto;
import vn.ansv.Dto.SlideshowProjectsDto;
import vn.ansv.Dto.Menu.MenuProjectsDto;
import vn.ansv.Entity.Project;

@Service
public class ProjectServiceImpl implements IProjectService {

	@Autowired
	private ProjectDao projectDao;
	
	public List<DashboardProjectDto> getDashboardTable(int week, int year) {
		return projectDao.getDashboardTable(week,year);
	}
	
	public List<SlideshowProjectsDto> getSlideshowProject(int week, int year) {
		
		List<SlideshowProjectsDto> list = new ArrayList<SlideshowProjectsDto>();
		list = projectDao.getSlideshowProject(week,year);
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
		}
		
		
		return list;
	}

	public List<MenuProjectsDto> getMenu(int week, int year) {
		return projectDao.getMenu(week,year);
	}
	
	public List<ProjectStatisticsDto> getProjectStatistics(int week, int year) {
		return projectDao.getProjectStatistics(week,year);
	}
	
	public List<ProjectDetailDto> getById(int id) {
		
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		list = projectDao.getById(id);
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
		}
		
		return list;
	}
	
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
	
	public Project getLessById(int id, String pic) {
		return projectDao.getLessById(id, pic);
	}
	
	public Project getMorebyId(int id, String pic) {
		return projectDao.getMorebyId(id, pic);
	}
	
	public Project getProjectTkById(int id) {
		return projectDao.getProjectTkById(id);
	}
	
	public Project getProjectById(int id) {
		return projectDao.getProjectById(id);
	}
	
	public List<ProjectDetailDto> getByIdAndPic(int id, String pic) {
		List<ProjectDetailDto> list = new ArrayList<ProjectDetailDto>();
		list =  projectDao.getByIdAndPic(id,pic);
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
		}
		
		return list;
	}
	
	public List<ProjectDetailDto> getAllProjectByCustomer(int week, int year, int customer, int type) {
		return projectDao.getAllProjectByCustomer(week, year, customer, type);
	}
	
	public List<DashboardProjectPicDto> getDashboardAM(int week, int year, String pic_id) {
		return projectDao.getDashboardAM(week, year, pic_id);
	}
	
	public List<DashboardProjectPicDto> getDashboardPM(int week, int year, String pic_id) {
		return projectDao.getDashboardPM(week, year, pic_id);
	}
	
	
	// Đầu: Thống kê số lượng dự án theo loại dự án, ưu tiên và tình trạng
	public List<Integer> thong_ke(int week, int year) {
		
		List<ProjectStatisticsDto> list = new ArrayList<ProjectStatisticsDto>();
		list = projectDao.getProjectStatistics(week,year);
		int size = list.size();
		int count_status = 0,
			position = 0;
		// Tạo ra mảng chứa dữ liệu thống kê cho phần menu
		List<Integer> thong_ke = new ArrayList<Integer>();
		for (int i = 0; i < 30; i++) {
			thong_ke.add(i, count_status);
		}
		
		for (int i = 0; i < size; i++) {
			// Thống kê số lượng dự án cho phần menu (loại dự án "triển khai")
			if (list.get(i).getType().contains("Triển khai")) {
				statisticalByType(list, thong_ke, i, position);
			}
			if (list.get(i).getType().contains("Viễn thông")) {
				position = 10;
				statisticalByType(list, thong_ke, i, position);
			}
			if (list.get(i).getType().contains("Chuyển đổi số")) {
				position = 20;
				statisticalByType(list, thong_ke, i, position);
			}
		}
		System.out.println("Thống kê: " + thong_ke);
		
		return thong_ke;
	}
	
	public List<Integer> statisticalByType(List<ProjectStatisticsDto> list, List<Integer> thong_ke, int i, int position) {
		
		// Thống kê ưu tiên thứ nhất
		if (list.get(i).getPriority().contains("First")) {
			if (list.get(i).getStatus().contains("High")) {
				System.out.println(i + ", " + "First - High");
				thong_ke.set(position, thong_ke.get(position) + 1);
			}
			if (list.get(i).getStatus().contains("Medium")) {
				System.out.println(i + ", " + "First - Medium");
				thong_ke.set(position + 1, thong_ke.get(position + 1) + 1);
			}
			if (list.get(i).getStatus().contains("Low")) {
				System.out.println(i + ", " + "First - Low");
				thong_ke.set(position + 2, thong_ke.get(position + 2) + 1);
			}
		}
		// Thống kê ưu tiên thứ hai
		if (list.get(i).getPriority().contains("Second")) {
			if (list.get(i).getStatus().contains("High")) {
				System.out.println(i + ", " + "Seccond - High");
				thong_ke.set(position + 3, thong_ke.get(position + 3)+1);
			}
			if (list.get(i).getStatus().contains("Medium")) {
				System.out.println(i + ", " + "Seccond - Medium");
				thong_ke.set(position + 4, thong_ke.get(position + 4)+1);
			}
			if (list.get(i).getStatus().contains("Low")) {
				System.out.println(i + ", " + "Seccond - Low");
				thong_ke.set(position + 5, thong_ke.get(position + 5)+1);
			}
		}
		// Thống kê ưu tiên thứ ba
		if (list.get(i).getPriority().contains("Third")) {
			if (list.get(i).getStatus().contains("High")) {
				System.out.println(i + ", " + "Third - High");
				thong_ke.set(position + 6, thong_ke.get(position + 6)+1);
			}
			if (list.get(i).getStatus().contains("Medium")) {
				System.out.println(i + ", " + "Third - Medium");
				thong_ke.set(position + 7, thong_ke.get(position + 7)+1);
			}
			if (list.get(i).getStatus().contains("Low")) {
				System.out.println(i + ", " + "Third - Low");
				thong_ke.set(position + 8, thong_ke.get(position + 8)+1);
			}
		}
		// Thống kê ưu tiên thứ tư (Đã hoàn thành)
		if (list.get(i).getPriority().contains("None")) {
			thong_ke.set(position + 9, thong_ke.get(position + 9)+1);
		}
		
		return thong_ke;
	}

	// Insert dự án (Viễn thông / Chuyển đổi số)
	public void save(Project project){
		projectDao.save(project);
	}
	
	public void update(Project project){
		projectDao.update(project);
	}
	
	public void updateInteractive(int id, String interactive){
		projectDao.updateInteractive(id, interactive);
	}
	
	public void update_tk(Project project){
		projectDao.update_tk(project);
	}
	
	public void delete(int id){
		projectDao.delete(id);
	}
	
	public int getMaxId(){
		return projectDao.getMaxId();
	}
	
	public int getTypeForProject(int id){
		return projectDao.getTypeForProject(id);
	}

	public Project getFormDeployment(int id) {
		return projectDao.getFormDeployment(id);
	}
	
	// Test: Insert dự án (Triển khai)
	public void saveDeploymentTest(Project project){
		projectDao.saveDeploymentTest(project);
	}
	
	// Insert dự án (Triển khai)
	public void saveDeployment(Project project, int id){
		projectDao.saveDeployment(project, id);
	}
	
	public void saveDep(Project project){
		projectDao.saveDep(project);
	}

}
