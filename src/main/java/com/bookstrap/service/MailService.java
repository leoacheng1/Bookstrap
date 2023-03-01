package com.bookstrap.service;

import java.io.IOException;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailFolder;
import com.bookstrap.model.bean.SendMailDto;
import com.bookstrap.model.dao.AccountLabelRepository;
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
	
	@Autowired
	private AccountLabelRepository accountLabelDao;
	
	public MailService() {
	}

// ================================================= for Counting =============================================================
	public Long getMailCountInFolder(Integer folderId, Integer accountId) {
		return accountMailDao.getMailCountInFolder(folderId, accountId);
	};
	public Long getImportantMailCount(Integer accountId) {
		return accountMailDao.getImportantMailCount(accountId);
	};
	public Long getstarredMailCount(Integer accountId) {
		return accountMailDao.getstarredMailCount(accountId);
	};
// ================================================= for Searching =============================================================
	public MailFolder findByFolderName(String FolderName) {
		MailFolder folder = mailFolderDao.findByFolderName(FolderName);
		return folder;
	}
	
	public MailAccount findByEmployees(Employees employee) {
		return mailAccountDao.findByEmployee(employee);
	}
	
	public MailAccount findAccountById(Integer accountId) {
		Optional<MailAccount> optional = mailAccountDao.findById(accountId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Set<AccountMail> findAllInInbox(MailAccount mailAccount) {
		Set<AccountMail> accountMails = accountMailDao.findByMailAccountAndMailfrom(mailAccount, (short)0);
		return accountMails;
	}
	
	public boolean moveMailFolder(AccountMail mail, MailFolder folder) {
		if (mail == null || folder == null) {
			return false;
		}
		mail.setMailFolder(folder);
		return true;
	}
	
	public Mail findMailById(Integer mailId) {
		Optional<Mail> optional = mailDao.findById(mailId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	
	public MailAttachment findMailAttachmentById(Integer mailAttachmentId) {
		Optional<MailAttachment> optional = attachmentDao.findById(mailAttachmentId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<AccountMail> findMailByFolderAndPage(MailAccount account,Integer folderId, Integer pageNum) {
		PageRequest pageRequest = PageRequest.of(pageNum - 1, 20, Sort.by("mail_mailTime").descending());
		Optional<MailFolder> folder = mailFolderDao.findById(folderId);
		if (folder.isEmpty()) {
			return null;
		}
		Page<AccountMail> page = accountMailDao.findByMailAccountAndMailFolder(account, folder.get(), pageRequest);
		return page;
	}
// ================================================= for Inserting =============================================================
	public AccountLabel addLabel(MailAccount account, String labelName) {
		AccountLabel newLabel = new AccountLabel();
		newLabel.setLabelName(labelName);
		newLabel.setMailAccount(account);			
		return accountLabelDao.save(newLabel);
		
	} 
	
	
	public Mail sendMail(MailAccount mailFrom,SendMailDto mailDto) throws IOException {
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
				mailAttachment.setAttachmentName(file.getOriginalFilename());
				mailAttachment.setAttachmentType(file.getContentType());
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
		from.onCreate();
		to.onCreate();
		from.setMailfrom((short)1);
		to.setMailfrom((short)0);
		
		
		from.setMailFolder(mailFolderDao.findById(2).get());
		to.setMailFolder(mailFolderDao.findById(1).get());
		
		accountMailDao.save(from);
		accountMailDao.save(to);
		return newMail;
	}
	
	public Mail draftMail(MailAccount mailFrom,SendMailDto mailDto) throws IOException {
		MultipartFile[] files = mailDto.getFile();
		Mail mail = new Mail();
		if (mailDto.getMailTo() != null) {
			MailAccount mailTo = mailAccountDao.findByAccount(mailDto.getMailTo());
			mail.setAccountTo(mailTo);					
		}
		
		// folder 1:inbox, 2:sent, 3:draft, 4: delete
				
		//add mail
		mail.setAccountFrom(mailFrom);
		mail.setMailSubject(mailDto.getMailSubject());
		mail.setMailContent(mailDto.getMailContent());
		Mail newMail = mailDao.save(mail);
		
		
		//add attachment
		if(files != null) {
			for (MultipartFile file : files) {
				MailAttachment mailAttachment = new MailAttachment();
				byte[] fileBytes = file.getBytes();
				mailAttachment.setAttachmentFile(fileBytes);
				mailAttachment.setAttachmentName(file.getOriginalFilename());
				mailAttachment.setAttachmentType(file.getContentType());
				mailAttachment.setMail(newMail);
				attachmentDao.save(mailAttachment);
			}			
		}
		//add 2 account mail
		AccountMail from = new AccountMail();
		AccountMailPK fromPK = new AccountMailPK(newMail.getMailId(),mailFrom.getAccountId());
		from.setAccountMailId(fromPK);
		from.onCreate();
		from.setMailfrom((short)1);		
		from.setMailFolder(mailFolderDao.findById(3).get());
		
		accountMailDao.save(from);
		return newMail;		
	}
// ================================================= for Updating =============================================================
	public AccountMail setImportant(Short important,Integer mailId,Integer accountId) {
		AccountMailPK accountMailPK = new AccountMailPK(mailId,accountId);
		Optional<AccountMail> optional = accountMailDao.findById(accountMailPK);
		if (optional.isPresent()) {
			AccountMail mail = optional.get();
			mail.setImportant(important);
			return accountMailDao.save(mail);
		}
		return null;
	}
	public AccountMail setStarred(Short starred,Integer mailId,Integer accountId) {
		AccountMailPK accountMailPK = new AccountMailPK(mailId,accountId);
		Optional<AccountMail> optional = accountMailDao.findById(accountMailPK);
		if (optional.isPresent()) {
			AccountMail mail = optional.get();
			mail.setStarred(starred);
			return accountMailDao.save(mail);
		}
		return null;
	}
	
	public AccountMail setFolder(Integer FolderId, Integer mailId, Integer accountId) {
		Optional<AccountMail> optional = accountMailDao.findById(new AccountMailPK(mailId,accountId));
		if (optional.isPresent()) {
			AccountMail mail = optional.get();
			mail.setFolderId(FolderId);			
			return accountMailDao.save(mail);
		}
		return null;
	}
//================================================= for Deleting =============================================================
	public boolean deleteLabel(Integer labelId) {
		Optional<AccountLabel> optional = accountLabelDao.findById(labelId);
		if (optional.isPresent()) {
			AccountLabel accountLabel = optional.get();
			Set<AccountMail> mails = accountLabel.getAccountMails();
			if (mails != null) {
				for (AccountMail mail : mails) {
					mail.removeAccountLabel(accountLabel);
					accountMailDao.save(mail);
				}
			}
			accountLabelDao.deleteById(labelId);			
			return true;
		}
		return false;
	}

}
