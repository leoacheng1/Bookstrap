package com.bookstrap.service;

import java.io.IOException;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailDto;
import com.bookstrap.model.dao.AccountMailRepository;
import com.bookstrap.model.dao.MailAccountRepository;
import com.bookstrap.model.dao.MailAttachmentRepository;
import com.bookstrap.model.dao.MailFolderRepository;
import com.bookstrap.model.dao.MailRepository;
import com.bookstrap.model.pk.AccountMailPK;

@Service
@Transactional
public class MailService {
	
	@Autowired
	private MailRepository mailDao;
	
	@Autowired
	private MailAttachmentRepository attachmentDao;
	
	@Autowired
	private MailAccountRepository mailAccountDao;
	
	@Autowired
	private AccountMailRepository accountMailDao;
	
	@Autowired
	private MailFolderRepository mailFolderDao;
	
	public MailService() {
	}
	
	public MailAccount findByEmployees(Employees employee) {
		return mailAccountDao.findByEmployee(employee);
	}
	
	public Set<AccountMail> findAllInInbox(MailAccount mailAccount) {
		Set<AccountMail> accountMails = accountMailDao.findByMailAccountAndMailfrom(mailAccount, (short)0);
		for (AccountMail accountMail : accountMails) {
			System.out.println(accountMail.getMail().getMailSubject());
		}
		return accountMails;
	}
	
	public Mail sendMail(MailAccount mailFrom,MailDto mailDto) throws IOException {
		MultipartFile[] files = mailDto.getFile();
		MailAccount mailTo = mailAccountDao.findByAccount(mailDto.getMailTo());
		
		// folder 1:inbox, 2:sent, 3:draft, 4: delete
				
		//add mail
		Mail mail = new Mail();
		mail.setAccountFrom(mailFrom);
		mail.setAccountTo(mailTo);		
		mail.setMailSubject(mailDto.getMailSubject());
		mail.setMailContent(mailDto.getMailContent());
		Mail newMail = mailDao.save(mail);
		
		
		//add attachment
		if(files != null) {
			for (MultipartFile file : files) {
				MailAttachment mailAttachment = new MailAttachment();
				byte[] fileBytes = file.getBytes();
				mailAttachment.setAttachmentFile(fileBytes);
				mailAttachment.setMail(newMail);
				attachmentDao.save(mailAttachment);
			}			
		}
		
		//add 2 account mail
		AccountMail from = new AccountMail();
		AccountMail to = new AccountMail();
		AccountMailPK fromPK = new AccountMailPK(newMail.getMailId(),mailFrom.getAccountId());
		AccountMailPK toPK = new AccountMailPK(newMail.getMailId(),mailTo.getAccountId());
		from.setAccountMailId(fromPK);
		to.setAccountMailId(toPK);
		from.setMailfrom((short)1);
		to.setMailfrom((short)0);
		
		from.setMailFolder(mailFolderDao.findById(2).get());
		to.setMailFolder(mailFolderDao.findById(1).get());
		
		accountMailDao.save(from);
		accountMailDao.save(to);
		return newMail;
	}
	
	public Mail draftMail(MailAccount mailFrom,MailDto mailDto) throws IOException {
		MultipartFile[] files = mailDto.getFile();
		MailAccount mailTo = mailAccountDao.findByAccount(mailDto.getMailTo());
		Mail mail = new Mail();
		mail.setAccountFrom(mailFrom);
		mail.setAccountTo(mailTo);		
		mail.setMailSubject(mailDto.getMailSubject());
		mail.setMailContent(mailDto.getMailContent());
		Mail newMail = mailDao.save(mail);
		
		
		//add attachment
		for (MultipartFile file : files) {
			MailAttachment mailAttachment = new MailAttachment();
			byte[] fileBytes = file.getBytes();
			mailAttachment.setAttachmentFile(fileBytes);
			mailAttachment.setMail(newMail);
			attachmentDao.save(mailAttachment);
		}
		AccountMail from = new AccountMail();
		AccountMailPK fromPK = new AccountMailPK(newMail.getMailId(),mailFrom.getAccountId());
		from.setAccountMailId(fromPK);
		from.setFolderId(3);
		accountMailDao.save(from);
		return newMail;
	};
	

	
	
	

	
}
