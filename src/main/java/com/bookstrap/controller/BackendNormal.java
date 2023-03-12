package com.bookstrap.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.AllMailDto;
import com.bookstrap.model.bean.ConditionDto;
import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailCategory;
import com.bookstrap.model.bean.MailCountDto;
import com.bookstrap.model.bean.MailFolder;
import com.bookstrap.model.bean.SendMailDto;
import com.bookstrap.model.bean.ViewMailDto;
import com.bookstrap.service.EmployeesService;
import com.bookstrap.service.MailService;

@Controller
public class BackendNormal {
//too lazy to move to rest controller

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
	public Mail insertMail(SendMailDto mail, HttpSession session) throws IOException, SQLException {
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
	
	@GetMapping("/mail/sent/{accountId}")
	@ResponseBody
	public LinkedHashSet<String> findAllSentAccount(@PathVariable("accountId") Integer accountId) {
		return mailService.findAllSentAccount(accountId);
	}
	
	@GetMapping("/mail/from/{accountId}")
	@ResponseBody
	public LinkedHashSet<String> findAllFromAccount(@PathVariable("accountId") Integer accountId) {
		return mailService.findAllFromAccount(accountId);
	}
	
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
			mailToSend.setFrom(accountMail.getMail().getAccountFrom().getAccount());
			mailToSend.setFromLink("/Bookstrap/backend/mailpage/composemail?to="+accountMail.getMail().getAccountFrom().getAccount());
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink(""+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mailToSend.setMailCategory(accountMail.getMailCategory());
			mailToSend.setMailFolder(accountMail.getMailFolder());
			mailToSend.setMailLabels(accountMail.getAccountLabels());
			mails.add(mailToSend);
		};
		return mails; 	
	}
	
	@GetMapping("mail/folder/{folderName}/{pageNum}")
	@ResponseBody
	public List<AllMailDto> getAllMailInFolder(HttpSession session, @PathVariable("folderName") String folderName,
			@PathVariable("pageNum") Integer pageNum) {
		Integer empId = (Integer) session.getAttribute("empId");		
		Employees employee = empService.findById(empId);
		MailAccount account = mailService.findByEmployees(employee);
		MailFolder folder = mailService.findByFolderName(folderName);
		if (folder == null) {
			return null;
		}
		Page<AccountMail> page = mailService.findMailByFolderAndPage(account, folder.getFolderId(), pageNum);
		
		List<AccountMail> accountMails = page.getContent();
		List<AllMailDto> mails = new ArrayList<AllMailDto>();
		for (AccountMail accountMail : accountMails) {
			AllMailDto mailToSend = new AllMailDto();
			mailToSend.setFrom(accountMail.getMail().getAccountFrom().getAccount());
			MailAccount mailFrom = accountMail.getMail().getAccountFrom();
			mailToSend.setFromLink("/Bookstrap/backend/mailpage/composemail?to=" + (mailFrom == null ? "" : mailFrom.getAccount()));
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink("/Bookstrap/backend/mailpage/readmail/"+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mailToSend.setMailCategory(accountMail.getMailCategory());
			mailToSend.setMailFolder(accountMail.getMailFolder());
			mailToSend.setMailLabels(accountMail.getAccountLabels());
			mails.add(mailToSend);
		};
		return mails; 	
	}
	@GetMapping("mail/category/{categoryName}/{pageNum}")
	@ResponseBody
	public List<AllMailDto> getAllMailInCategory(HttpSession session, @PathVariable("categoryName") String categoryName,
			@PathVariable("pageNum") Integer pageNum) {
		Integer empId = (Integer) session.getAttribute("empId");		
		Employees employee = empService.findById(empId);
		MailAccount account = mailService.findByEmployees(employee);
		MailCategory category = mailService.findByCategoryName(categoryName);
		if (category == null) {
			return null;
		}
		Page<AccountMail> page = mailService.findMailByCategoryAndPage(account, category.getCategoryId(), pageNum);
		
		List<AccountMail> accountMails = page.getContent();
		List<AllMailDto> mails = new ArrayList<AllMailDto>();
		for (AccountMail accountMail : accountMails) {
			AllMailDto mailToSend = new AllMailDto();
			mailToSend.setFrom(accountMail.getMail().getAccountFrom().getAccount());
			MailAccount mailFrom = accountMail.getMail().getAccountFrom();
			mailToSend.setFromLink("/Bookstrap/backend/mailpage/composemail?to=" + (mailFrom == null ? "" : mailFrom.getAccount()));
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink("/Bookstrap/backend/mailpage/readmail/"+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mailToSend.setMailCategory(accountMail.getMailCategory());
			mailToSend.setMailFolder(accountMail.getMailFolder());
			mailToSend.setMailLabels(accountMail.getAccountLabels());
			mails.add(mailToSend);
		};
		return mails; 	
	}
	
	@GetMapping("mail/label/{labelId}/{pageNum}")
	@ResponseBody
	public List<AllMailDto> getAllMailInLabel(HttpSession session, @PathVariable("labelId") String labelId,
			@PathVariable("pageNum") Integer pageNum) {
		Page<AccountMail> page;
		if (labelId.equals("important") || labelId.equals("starred")) {
			page = mailService.findMailByImportantOrStarredAndPage(labelId, pageNum);
		} else {
			System.out.println(labelId);
			page = mailService.findMailByLabelAndPage(Integer.valueOf(labelId), pageNum);			
		}
		
		List<AccountMail> accountMails = page.getContent();
		
		List<AllMailDto> mails = new ArrayList<AllMailDto>();
		for (AccountMail accountMail : accountMails) {
			AllMailDto mailToSend = new AllMailDto();
			mailToSend.setFrom(accountMail.getMail().getAccountFrom().getAccount());
			MailAccount mailFrom = accountMail.getMail().getAccountFrom();
			mailToSend.setFromLink("/Bookstrap/backend/mailpage/composemail?to=" + (mailFrom == null ? "" : mailFrom.getAccount()));
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink("/Bookstrap/backend/mailpage/readmail/"+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mailToSend.setMailCategory(accountMail.getMailCategory());
			mailToSend.setMailFolder(accountMail.getMailFolder());
			mailToSend.setMailLabels(accountMail.getAccountLabels());
			mails.add(mailToSend);
		};
		return mails; 	
	}
	
	@PostMapping("mail/conditions/{pageNum}")
	@ResponseBody
	public List<AllMailDto> findMailByConditions(HttpSession session,@RequestBody ConditionDto dto, @PathVariable("pageNum") Integer pageNum) {
		Integer empId = (Integer) session.getAttribute("empId");		
		Employees employee = empService.findById(empId);
		Integer accountId = mailService.findByEmployees(employee).getAccountId();
		List<AccountMail> accountMails = mailService.findMailByConditions(dto, accountId, pageNum);
		
		List<AllMailDto> mails = new ArrayList<AllMailDto>();
		for (AccountMail accountMail : accountMails) {
			AllMailDto mailToSend = new AllMailDto();
			mailToSend.setFrom(accountMail.getMail().getAccountFrom().getAccount());
			MailAccount mailFrom = accountMail.getMail().getAccountFrom();
			mailToSend.setFromLink("/Bookstrap/backend/mailpage/composemail?to=" + (mailFrom == null ? "" : mailFrom.getAccount()));
			mailToSend.setImportant(accountMail.getImportant());
			mailToSend.setStarred(accountMail.getStarred());
			mailToSend.setSubject(accountMail.getMail().getMailSubject());
			mailToSend.setMailLink("/Bookstrap/backend/mailpage/readmail/"+accountMail.getMail().getMailId());
			mailToSend.setMailTime(accountMail.getMail().getMailTime());
			mailToSend.setHasread(accountMail.getHasread());
			mailToSend.setMailId(accountMail.getMail().getMailId());
			mailToSend.setAttachmentIds(accountMail.getMail().getMailAttachment().stream().map(attachment -> attachment.getAttachmentId()).toArray(Integer[]::new));
			mailToSend.setMailContent(Jsoup.parse(accountMail.getMail().getMailContent()).text());
			mailToSend.setMailCategory(accountMail.getMailCategory());
			mailToSend.setMailFolder(accountMail.getMailFolder());
			mailToSend.setMailLabels(accountMail.getAccountLabels());
			mails.add(mailToSend);
		};
		return mails; 	
		
	}

	@GetMapping("mail/countall/{accountId}")
	@ResponseBody
	public MailCountDto getAllCounts(@PathVariable("accountId") Integer accountId) {
		//folder 1:inbox, 2:sent, 3:draft, 4: delete
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
	
	@GetMapping("mail/count/{type}/{identifier}/{accountId}")
	@ResponseBody
	public Long getCount(@PathVariable("type") String type, @PathVariable("identifier") String identifier, @PathVariable("accountId") Integer accountId) {
		if (type.equals("folder")) {
			return mailService.getMailCountInFolder(mailService.findByFolderName(identifier).getFolderId(),accountId);
		}else if (type.equals("category")) {
			return mailService.getMailCountInCategory(mailService.findByCategoryName(identifier).getCategoryId(), accountId);
		}else if (type.equals("label")) {
			if (identifier.equals("important")) {
				return mailService.getImportantMailCount(accountId);
			}else if (identifier.equals("starred")) {
				return mailService.getstarredMailCount(accountId);
			}else {
				Integer labelId = Integer.parseInt(identifier);
				return mailService.getMailCountInLabel(labelId, accountId);
			}
		}else {
			return null;
		}
	}
	
	@PostMapping("mail/conditions/count")
	@ResponseBody
	public Long getMailsCountByConditions(HttpSession session,@RequestBody ConditionDto dto) {
		Integer empId = (Integer) session.getAttribute("empId");		
		Employees employee = empService.findById(empId);
		Integer accountId = mailService.findByEmployees(employee).getAccountId();
		return mailService.getMailsCountByConditions(dto, accountId);
		
	}
		
	@GetMapping("mail/label/findall/{accountId}")
	@ResponseBody
	public List<AccountLabel> getAllLabels(@PathVariable("accountId") Integer accountId) {
		return mailService.findAllLabelByAccountId(accountId);
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
	
	@PutMapping("mail/hasread/{mailId}")
	@ResponseBody
	public AccountMail updateHasread(@PathVariable("mailId") Integer mailId, @RequestParam("accountId") Integer accId,@RequestParam("hasread") Short hasread) {
		return mailService.setHasread(hasread, mailId, accId);
	}
	
	@PutMapping("mail/hasreads/{hasread}")
	@ResponseBody
	public Integer updateHasreads(@RequestParam("mailIds") Integer[] mailIds, @RequestParam("accountId") Integer accountId, @PathVariable("hasread") Short hasread) {
		return mailService.setHasreads(hasread, mailIds, accountId);
	}
	
	@PutMapping("mail/folder/{folderId}")
	@ResponseBody
	public Integer updateFolder(@PathVariable("folderId") Integer folderId, @RequestParam("accountId") Integer accId,@RequestParam("mailIds") Integer[] mailIds) {
		return mailService.setFolder(folderId, mailIds, accId).length;
	}
	
	@PutMapping("mail/label/{labelId}")
	@ResponseBody
	public Integer addLabel(@PathVariable("labelId") Integer labelId, @RequestParam("accountId") Integer accId, @RequestParam("mailIds") Integer[] mailIds) {
		return mailService.addLabelToMail(labelId, mailIds, accId);
	}
	
	@PutMapping("mail/labels")
	@ResponseBody
	public Integer setLabels(@RequestParam("labelIds") Integer[] labelIds, @RequestParam("mailIds") Integer[] mailIds, @RequestParam("accountId") Integer accountId) {
		return mailService.setLabelsToMails(labelIds, mailIds, accountId);
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
	
	@DeleteMapping("mail/multiple")
	@ResponseBody
	public Integer[] deleteMail(@RequestParam("mailIds") Integer[] mailIds, @RequestParam("accountId") Integer accountId) {
		Integer[] deleted = mailService.deleteMail(accountId, mailIds);
		return deleted;
	}
	
}
