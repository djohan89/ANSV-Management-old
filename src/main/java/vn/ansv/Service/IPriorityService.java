package vn.ansv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ansv.Entity.Priority;

@Service
public interface IPriorityService {
	@Autowired
	public List<Priority> getAllPriorityForm();
	public List<Priority> getAllStatusForm();
	public List<Priority> getAllTypeForm();
	public Priority getAllProductForm(int id);
}
