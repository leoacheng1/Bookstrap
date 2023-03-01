package com.bookstrap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.service.EmployeesService;
import com.bookstrap.service.MailService;

@Controller
@RequestMapping("/backend/mailpage")
public class MailPageController {
	
	@Autowired
	private EmployeesService empService;
	
	@Autowired
	private MailService mailService;
	
	@ModelAttribute(name="mailAccount")
	public MailAccount getMailAccount(HttpSession session) {
		return mailService.findByEmployees(empService.findById((Integer)session.getAttribute("empId")));
	}
	
	@GetMapping("/readmail/{mailId}")
	public String viewMail(@PathVariable("mailId") Integer mailId, HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/viewmail";
	}
	
	@GetMapping("/folder/inbox")
	public String inbox(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
	@GetMapping("/folder/sent")
	public String sent(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
	@GetMapping("/folder/draft")
	public String draft(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
	@GetMapping("/folder/bin")
	public String bin(HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
	
	@GetMapping("/composemail")
	public String composeMail(HttpSession session,Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/writemail";
	}

}
