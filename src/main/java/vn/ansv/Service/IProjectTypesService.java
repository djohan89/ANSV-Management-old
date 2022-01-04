package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Entity.ProjectTypes;

@Service
public interface IProjectTypesService {

	@Autowired
	public List<ProjectTypes> getAll();
	public List<ProjectTypes> getMenu(int week, int year);
	public List<ProjectTypes> getMenuByPic(int week, int year, String pic);
	
}
