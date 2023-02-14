package com.bookstrap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.model.bean.Employees;
import com.bookstrap.service.EmployeesService;

@Controller
public class BackendPage {
	@Autowired
	private EmployeesService empService;

	@GetMapping("/backend/login")
	public String LoginPage(Model m) {
		return "/backend/login";
	}

	@PostMapping("backend/login")
	public String LoginCheck(@RequestParam("account") String account, @RequestParam("password") String password,
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

	@GetMapping("backend/index")
	public String IndexPage(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		String pos = (String) session.getAttribute("empPosition");
		
		//get view according to empPosition, change if they want to specify position name in Chinese
		switch (pos) {
			case "admin":
				return "backend/controllpanel/admin/adminindex";
			case "owner":
				return "backend/controllpanel/owner/ownerindex";
			case "employee":
				return "backend/controllpanel/employee/employeeindex";
			default:
				m.addAttribute("error", "您無法造訪該頁面");
				return "backend/login";
		}
	}

	@GetMapping("/backend/test")
	public void Test() {
		Employees emp = empService.findByUsername("Elizabeth");
		System.out.println(emp.getAccount());
		System.out.println(emp.getPassword());
	}
	
	@GetMapping("/backend/template")
	public String TemplatePage() {
		return "/backend/layout/template";
	}

}
