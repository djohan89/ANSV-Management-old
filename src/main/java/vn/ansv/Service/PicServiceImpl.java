package vn.ansv.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.PicDao;
import vn.ansv.Dto.Menu.MenuPicDto;

@Service
public class PicServiceImpl {

	@Autowired
	private PicDao picDao;
	
	public void save(int project_id, String pic){
		picDao.save(project_id, pic);
	}
	
	public void delete(int project_id){
		picDao.delete(project_id);
	}
	
	public String getPICByProjectId(int project_id) {
		return picDao.getPICByProjectId(project_id);
	}
	
	// Kiểm tra pic có đảm nhận dự án này ko
	public boolean checkPicOfProjectIsset(int id, String pic_id) {
		List<MenuPicDto> list = new ArrayList<MenuPicDto>();
		list = picDao.getAllPicOfProject(id);
		boolean st = false;
		int count = 0;
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getPic_id() == pic_id) {
				count++;
			}
		}
		
		if (count > 0) {
			st = true;
		}
		
		return st;
	}
	
}
