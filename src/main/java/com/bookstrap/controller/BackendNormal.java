package com.bookstrap.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	@PostMapping("backend/login")
	public String loginCheck(@RequestParam("account") String account, @RequestParam("password") String password,
			HttpSession session, Model m) {
		Employees emp = empService.findByUsername(account);
		if (emp == null) {
			m.addAttribute("error", "無法找到該使用者");
			return "backend/login";
		} else if (!emp.getPassword().equals(password)) {
			m.addAttribute("error", "密碼錯誤");
			return "backend/login";
		}
		String position = emp.getEmpPosition();
		session.setAttribute("empAccount", emp.getAccount());
		session.setAttribute("empName", emp.getEmpName());
		session.setAttribute("empPosition", emp.getEmpPosition());
		return "redirect:index";
	}
	
	@GetMapping("backend/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:http://localhost:8080/Bookstrap/backend/login";
	}

	@PostMapping("employee/insert")
	@ResponseBody
	public Employees insertEmployee(@RequestParam("empPhoto") MultipartFile photoFile,
			@RequestParam("empName") String empName, @RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("sex") Byte sex,
			@RequestParam("empPosition") String empPosition, RedirectAttributes redirectAttributes) throws IOException {
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
