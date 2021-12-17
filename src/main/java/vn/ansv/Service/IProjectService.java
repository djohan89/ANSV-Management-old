package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dto.DashboardProjectsDto;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.ProjectStatisticsDto;
import vn.ansv.Dto.Menu.MenuProjectsDto;

@Service
public interface IProjectService {

	@Autowired
	public List<DashboardProjectsDto> getAllByWeek(int week);
	public List<MenuProjectsDto> getMenu(int week);
	public List<ProjectStatisticsDto> getProjectStatistics(int week);
	public List<ProjectDetailDto> getAllDetailById(int id);
	public List<ProjectDetailDto> getAllProjectByCustomerAndWeek(int customer_id,int week);
}
