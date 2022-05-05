package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.PriorityDao;
import vn.ansv.Entity.Priority;

@Service
public class PriorityServiceImpl implements IPriorityService{
	@Autowired
	private PriorityDao priorityDao;

	public int checkPriorityIssets(String priority_name) {
		return priorityDao.checkPriorityIssets(priority_name);
	}
	
	public int getPriorityIdByName(String priority_name) {
		return priorityDao.getPriorityIdByName(priority_name);
	}
	
	public int checkStatusIssets(String status_name) {
		return priorityDao.checkStatusIssets(status_name);
	}
	
	public int getStatusIdByName(String status_name) {
		return priorityDao.getStatusIdByName(status_name);
	}
	
	public List<Priority> getAllPriorityForm() {
		return priorityDao.getAllPriorityForm();
	}

	public List<Priority> getAllStatusForm() {
		return priorityDao.getAllStatusForm();
	}

	public List<Priority> getAllTypeForm() {
		return priorityDao.getAllTypeForm();
	}
	public Priority getAllProductForm(int id){
		return priorityDao.getAllProductForm(id);
	}
	public void update_prd(Priority product){
		priorityDao.update_prd(product);
	}

}
