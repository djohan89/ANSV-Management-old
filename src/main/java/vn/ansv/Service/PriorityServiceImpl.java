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

	public List<Priority> getAllPriorityForm() {
		return priorityDao.getAllPriorityForm();
	}

	public List<Priority> getAllStatusForm() {
		return priorityDao.getAllStatusForm();
	}

	public List<Priority> getAllTypeForm() {
		return priorityDao.getAllTypeForm();
	}

}
