package com.bookstrap.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailDto;
import com.bookstrap.model.dao.MailAccountRepository;
import com.bookstrap.model.dao.MailAttachmentRepository;
import com.bookstrap.model.dao.MailRepository;

@Service
@Transactional
public class MailService {
	
	@Autowired
	private MailRepository mailDao;
	
	@Autowired
	private MailAttachmentRepository attachmentDao;
	
	@Autowired
	private MailAccountRepository mailAccountDao;
	
	public MailService() {
	}
	public MailAccount findByEmployees(Employees employee) {
		return mailAccountDao.findByEmployee(employee);
	}
	public Mail insertMail(MailAccount mailFrom,MailDto mailDto) throws IOException {
		MultipartFile[] files = mailDto.getFile();

		Mail mail = new Mail();
		mail.setAccountFrom(mailFrom);
//		System.out.println(mailFrom.getAccount());
		mail.setAccountTo(mailAccountDao.findByAccount(mailDto.getMailTo()));
		System.out.println(mailDto.getMailTo());
		mail.setHasread(mailDto.getHasread());
		mail.setImportant(mailDto.getImportant());
		mail.setStarred(mailDto.getStarred());
		mail.setMailContent(mailDto.getMailContent());
		Mail newMail = mailDao.save(mail);
		
		
		for (MultipartFile file : files) {
			MailAttachment mailAttachment = new MailAttachment();
			byte[] fileBytes = file.getBytes();
			mailAttachment.setAttachmentFile(fileBytes);
			mailAttachment.setMail(newMail);
			attachmentDao.save(mailAttachment);
		}
		

		return newMail;
	}
	
}
