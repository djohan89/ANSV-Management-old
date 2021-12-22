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

	public List<Priority> getAllPriority() {
		
		return priorityDao.getAllPriority();
	}

	public List<Priority> getAllStatus() {
		// TODO Auto-generated method stub
		return priorityDao.getAllStatus();
	}

	public List<Priority> getAllType() {
		// TODO Auto-generated method stub
		return priorityDao.getAllType();
	}

}
