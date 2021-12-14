package vn.ansv.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Dao.RoleDao;

@Service
public class RoleServiceImpl {

	@Autowired
	private RoleDao roleDao;
	
	public int getCount(){
		// validate business
		return roleDao.getCount();
	}
	
}
