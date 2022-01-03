package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.ProjectTypesDao;
import vn.ansv.Entity.ProjectTypes;

@Service
public class ProjectTypesServiceImpl implements IProjectTypesService {
	
	@Autowired
	private ProjectTypesDao projectTypesDao;

	public List<ProjectTypes> getAll() {
		return projectTypesDao.getAll();
	}

	public List<ProjectTypes> getMenu(int week, int year) {
		return projectTypesDao.getMenu(week,year);
	}
	
}
