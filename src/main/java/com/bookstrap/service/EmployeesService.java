package com.bookstrap.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.EmployeesRepository;
import com.bookstrap.model.bean.Employees;

@Service
@Transactional
public class EmployeesService {

	@Autowired 
	private EmployeesRepository empDao;
	
	public Employees findByUsername(String username) {
		Optional<Employees> emp = empDao.findByAccount(username);
		if (emp.isEmpty()) {
			return null;
		}
		return emp.get();
	}
	
	public byte[] findempPhotoByUsername(String username) {
		Optional<Employees> emp = empDao.findByAccount(username);
		if (emp.isPresent()) {
			return emp.get().getEmpPhoto();
		}
		return null;
	}
	
	public Employees insertEmployee(Employees emp) {
		return empDao.save(emp);
	}
	
	public Employees findById(Integer empId) {
		Optional<Employees> emp = empDao.findById(empId);
		if (emp.isEmpty()) {
			return null;
		}
		return emp.get();
	}

}
