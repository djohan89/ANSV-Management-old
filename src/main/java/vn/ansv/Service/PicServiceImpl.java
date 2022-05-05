package vn.ansv.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.PicDao;

@Service
public class PicServiceImpl {

	@Autowired
	private PicDao picDao;
	
	public int checkUsersIssets(String pic_name) {
		return picDao.checkUsersIssets(pic_name);
	}
	
	public String getIdByName(String pic_name) {
		return picDao.getIdByName(pic_name);
	}
	
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
	public int checkPicOfProjectIsset(int id, String pic_id) {
		return picDao.getAllPicOfProject(id, pic_id);
	}
	
}
