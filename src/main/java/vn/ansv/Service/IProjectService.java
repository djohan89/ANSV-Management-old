package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dto.DashboardProjectDto;
import vn.ansv.Dto.DashboardProjectPicDto;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.ProjectStatisticsDto;
import vn.ansv.Dto.SlideshowProjectsDto;
import vn.ansv.Dto.Menu.MenuProjectsDto;
import vn.ansv.Entity.Project;

@Service
public interface IProjectService {

	@Autowired
	public List<DashboardProjectDto> getDashboardTable(int week, int year);
	public List<SlideshowProjectsDto> getSlideshowProject(int week, int year);
	public List<MenuProjectsDto> getMenu(int week, int year);
	public List<ProjectStatisticsDto> getProjectStatistics(int week, int year);
	public List<ProjectDetailDto> getById(int id);
	public Project getLessById(int id, String pic);
	public List<ProjectDetailDto> getByIdAndPic(int id, String pic);
	public List<ProjectDetailDto> getAllProjectByCustomer(int week, int year, int customer, int type);
	public List<DashboardProjectPicDto> getDashboardTableByPIC(int week, int year, String pic_id);
	public Project getFormDeployment(int id);
}
