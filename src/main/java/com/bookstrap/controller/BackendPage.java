package com.bookstrap.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstrap.service.EmployeesService;
import com.bookstrap.service.MailService;

@Controller
@RequestMapping("/backend")
public class BackendPage {
	@Autowired
	private EmployeesService empService;
	
	@Autowired
	private MailService mailService;

	@GetMapping("/login")
	public String loginPage() {
		return "/backend/login";
	}

	@GetMapping("/index")
	public String indexPage(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		String pos = (String) session.getAttribute("empPosition");

		// get view according to empPosition, change if they want to specify position
		// name in Chinese
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
	
	@GetMapping("/template")
	public String templatePage() {
		return "/backend/layout/template";
	}

}
