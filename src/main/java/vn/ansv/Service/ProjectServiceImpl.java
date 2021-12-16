package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.ProjectDao;
import vn.ansv.Dto.DashboardProjectsDto;
import vn.ansv.Dto.ProjectDetailDto;
import vn.ansv.Dto.Menu.MenuProjectsDto;

@Service
public class ProjectServiceImpl implements IProjectService {

	@Autowired
	private ProjectDao projectDao;
	
	public List<DashboardProjectsDto> getAllByWeek(int week) {
		return projectDao.getAllByWeek(week);
	}

	public List<MenuProjectsDto> getMenu(int week) {
		return projectDao.getMenu(week);
	}
	public List<ProjectDetailDto> getAllDetailByweek(int id) {
		return projectDao.getAllDetailByweek(id);
	}

}
