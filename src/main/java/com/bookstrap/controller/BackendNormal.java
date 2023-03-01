package com.bookstrap.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.AllMailDto;
import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailCountDto;
import com.bookstrap.model.bean.SendMailDto;
import com.bookstrap.model.bean.ViewMailDto;
import com.bookstrap.model.pk.AccountMailPK;
import com.bookstrap.service.EmployeesService;
import com.bookstrap.service.MailService;

@Controller
public class BackendNormal {

	@Autowired
	private EmployeesService empService;
	
	@Autowired
	private MailService mailService;
	

//===================================================LOGIN==========================================================
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
		session.setAttribute("empId", emp.getEmpId());
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

//===================================================POSTING==========================================================
	@PostMapping("employee/insert")
	@ResponseBody
	public Employees insertEmployee(@RequestParam("empPhoto") MultipartFile photoFile,
			@RequestParam("empName") String empName, @RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("sex") Short sex,
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
	
	
	@PostMapping("mail")
	@ResponseBody
	public Mail insertMail(SendMailDto mail, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("empAccount");
		Employees emp = empService.findByUsername(username);
		MailAccount account = mailService.findByEmployees(emp);
//		System.out.println(account.getAccount());
		return mailService.sendMail(account,mail);
	}
	
	
	@PostMapping("mail/draft")
	@ResponseBody
	public Mail draftMail(SendMailDto mail, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("empAccount");
		Employees emp = empService.findByUsername(username);
		MailAccount account = mailService.findByEmployees(emp);
//		System.out.println(account.getAccount());
		return mailService.draftMail(account,mail);
	}
	
	
	@PostMapping("mail/label")
	@ResponseBody
	public AccountLabel insertLabel(@RequestParam("labelName") String labelName, @RequestParam("accountId") Integer accountId) {
		MailAccount account = mailService.findAccountById(accountId);
		return mailService.addLabel(account, labelName);
		
	}
//===================================================GETTING==========================================================
	@GetMapping("/mail/{mailId}")
	@ResponseBody
	public ViewMailDto getMail(@PathVariable("mailId") Integer mailId) {
		 Mail mail = mailService.findMailById(mailId);
		 ViewMailDto dto = new ViewMailDto();
		 List<Integer> attachmentIds = new LinkedList<>();
		 Set<MailAttachment> attachments = mail.getMailAttachment();
		 for (MailAttachment attachment : attachments) {
			 attachmentIds.add(attachment.getAttachmentId());
		 };
		 dto.setAttachmentIds(attachmentIds.toArray(new Integer[attachmentIds.size()]));
		 dto.setMailFrom(mail.getAccountFrom().getAccount());
		 dto.setMailSubject(mail.getMailSubject());
		 dto.setMailTime(mail.getMailTime());
		 dto.setMailContent(mail.getMailContent());
		 return dto;
	}
	
	@GetMapping("/mail/attachment/{attachmentId}")
	@ResponseBody
	public ResponseEntity<byte[]> getMailAttachment(@PathVariable("attachmentId") Integer attachmentId) {
		MailAttachment attachment = mailService.findMailAttachmentById(attachmentId);
		if (attachment != null) {
			byte[] attachmentFile = attachment.getAttachmentFile();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.setContentDisposition(ContentDisposition.attachment().filename(attachment.getAttachmentName(), StandardCharsets.UTF_8).build());
			return new ResponseEntity<>(attachmentFile, headers, HttpStatus.OK);
		}
		return null; 
	}
	
	@GetMapping("mail")
	@ResponseBody
	public Set<AllMailDto> getAllMail(HttpSession session) {
		Integer empId = (Integer) session.getAttribute("empId");
		
		Employees employee = empService.findById(empId);
		MailAccount account = mailService.findByEmployees(employee);
//		System.out.println(account.getAccountId());
		Set<AccountMail> accountMails = mailService.findAllInInbox(account);
		LinkedHashSet<AllMailDto> mails = new LinkedHashSet<AllMailDto>();
		for (AccountMail accountMail : accountMails) {
			AllMailDto mailToSend = new AllMailDto();
			mailToSend.setFrom(accountMail.getMailAccount().getAccount());
			mailToSend.setFromLink("");
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink(""+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mails.add(mailToSend);
		};
		return mails; 	
	}
	
	@GetMapping("mail/countall/{accountId}")
	@ResponseBody
	public MailCountDto getAllCounts(@PathVariable("accountId") Integer accountId) {
		//folder 1:inbox, 2:sent, 3:draft, 4: delete
		MailCountDto dto = new MailCountDto();
		dto.setBinCount(mailService.getMailCountInFolder(4,accountId));
		dto.setCompanyCount(0L);
		dto.setDraftCount(mailService.getMailCountInFolder(3,accountId));
		dto.setImportantCount(mailService.getImportantMailCount(accountId));
		dto.setInboxCount(mailService.getMailCountInFolder(1,accountId));
		dto.setNormalCount(0L);
		dto.setSentCount(mailService.getMailCountInFolder(2,accountId));
		dto.setStarredCount(mailService.getstarredMailCount(accountId));
		dto.setWorkCount(0L);
		return dto;
	}
	
//===================================================Updating==========================================================
	@PutMapping("mail/important/{mailId}")
	@ResponseBody
	public AccountMail updateImportant(@PathVariable("mailId") Integer mailId,@RequestParam("accountId") Integer accId,@RequestParam("important") Short important) {
		return mailService.setImportant(important, mailId, accId);
	}
	@PutMapping("mail/starred/{mailId}")
	@ResponseBody
	public AccountMail updateStar(@PathVariable("mailId") Integer mailId,@RequestParam("accountId") Integer accId,@RequestParam("starred") Short starred) {
		return mailService.setStarred(starred, mailId, accId);
	}
	
	@PutMapping("mail/folder/{mailId}")
	@ResponseBody
	public AccountMail updateFolder(@PathVariable("mailId") Integer mailId, @RequestParam("accountId") Integer accId,@RequestParam("folderId") Integer folderId) {
		return mailService.setFolder(folderId, mailId, accId);
	}
//===================================================DELETING==========================================================
	@DeleteMapping("mail/label/{labelId}") 
	@ResponseBody
	public String deleteLabel(@PathVariable("labelId") Integer labelId) {
		if (mailService.deleteLabel(labelId)) {
			return "success"; 
		}
		return null;
	}
}
