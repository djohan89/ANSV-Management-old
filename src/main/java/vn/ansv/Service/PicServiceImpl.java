package vn.ansv.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.PicDao;

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
	
}
