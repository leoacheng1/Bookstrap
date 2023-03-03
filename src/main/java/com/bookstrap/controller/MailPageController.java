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
import com.bookstrap.model.bean.MailCountDto;
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
	
	@ModelAttribute(name="mailCount")
	public MailCountDto getAllCounts(HttpSession session) {
		//folder 1:inbox, 2:sent, 3:draft, 4: delete
		Integer accountId = mailService.findByEmployees(empService.findById((Integer)session.getAttribute("empId"))).getAccountId();
		MailCountDto dto = new MailCountDto();
		dto.setBinCount(mailService.getMailCountInFolder(mailService.findByFolderName("bin").getFolderId(),accountId));
		dto.setCompanyCount(mailService.getMailCountInCategory(mailService.findByCategoryName("company").getCategoryId(), accountId));
		dto.setDraftCount(mailService.getMailCountInFolder(mailService.findByFolderName("draft").getFolderId(),accountId));
		dto.setImportantCount(mailService.getImportantMailCount(accountId));
		dto.setInboxCount(mailService.getMailCountInFolder(mailService.findByFolderName("inbox").getFolderId(),accountId));
		dto.setNormalCount(mailService.getMailCountInCategory(mailService.findByCategoryName("normal").getCategoryId(), accountId));
		dto.setSentCount(mailService.getMailCountInFolder(mailService.findByFolderName("sent").getFolderId(),accountId));
		dto.setStarredCount(mailService.getstarredMailCount(accountId));
		dto.setWorkCount(mailService.getMailCountInCategory(mailService.findByCategoryName("job").getCategoryId(), accountId));
		return dto;
	  }
	
	
	
	
	@GetMapping("/readmail/{mailId}")
	public String viewMail(@PathVariable("mailId") Integer mailId, HttpSession session, Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/viewmail";
	}
		
	@GetMapping("/mailbox/{type}/{name}")
	public String inbox(HttpSession session, Model m, @PathVariable("type") String type, @PathVariable("name") String name) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
	@GetMapping("/mailbox/l/{type}/{id}")
	public String inboxl(HttpSession session, Model m, @PathVariable("type") String type, @PathVariable("id") Integer id) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/inbox";
	}
//	@GetMapping("/{type}/inbox")
//	public String inbox(HttpSession session, Model m, @PathVariable("type") String type) {
//		if (session.getAttribute("empAccount") == null) {
//			m.addAttribute("error", "請先登入");
//			return "backend/login";
//		}
//		m.addAttribute("type",type);
//		return "/backend/controllpanel/owner/mail/inbox";
//	}
//	
//	
//	@GetMapping("/folder/sent")
//	public String sent(HttpSession session, Model m) {
//		if (session.getAttribute("empAccount") == null) {
//			m.addAttribute("error", "請先登入");
//			return "backend/login";
//		}
//		return "/backend/controllpanel/owner/mail/inbox";
//	}
//	@GetMapping("/folder/draft")
//	public String draft(HttpSession session, Model m) {
//		if (session.getAttribute("empAccount") == null) {
//			m.addAttribute("error", "請先登入");
//			return "backend/login";
//		}
//		return "/backend/controllpanel/owner/mail/inbox";
//	}
//	@GetMapping("/folder/bin")
//	public String bin(HttpSession session, Model m) {
//		if (session.getAttribute("empAccount") == null) {
//			m.addAttribute("error", "請先登入");
//			return "backend/login";
//		}
//		return "/backend/controllpanel/owner/mail/inbox";
//	}
	
	@GetMapping("/composemail")
	public String composeMail(HttpSession session,Model m) {
		if (session.getAttribute("empAccount") == null) {
			m.addAttribute("error", "請先登入");
			return "backend/login";
		}
		return "/backend/controllpanel/owner/mail/writemail";
	}

}
