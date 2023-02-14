package com.bookstrap.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstrap.model.bean.Employees;
import com.bookstrap.service.EmployeesService;

@Controller 
public class BackendNormal {

	@Autowired
	private EmployeesService empService;
	
//	@PostMapping("/employee/insert")
//	public Employees insertEmployee(Employees emp) {
//		return empService.insertEmployee(emp);
//	}
	
	@PostMapping("employee/insert")
	@ResponseBody
	public Employees insertEmployee(
			@RequestParam("empPhoto") MultipartFile photoFile,
			@RequestParam("empName") String empName,
			@RequestParam("account") String account,
			@RequestParam("password") String password,
			@RequestParam("sex") Byte sex,
			@RequestParam("empPosition") String empPosition,
			RedirectAttributes redirectAttributes) throws IOException {
		Employees newEmp = new Employees();
		newEmp.setAccount(account);
		newEmp.setPassword(password);
		newEmp.setEmpName(empName);
		newEmp.setEmpPhoto(photoFile.getBytes());
		newEmp.setEmpPosition(empPosition);
		newEmp.setSex(sex);
		return empService.insertEmployee(newEmp);
	}

}
