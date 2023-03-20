package com.bookstrap.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.CleanResults;
import org.owasp.validator.html.PolicyException;
import org.owasp.validator.html.ScanException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.EmployeesRepository;
import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.ConditionDto;
import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.Mail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailAttachment;
import com.bookstrap.model.bean.MailCategory;
import com.bookstrap.model.bean.MailFolder;
import com.bookstrap.model.bean.SendMailDto;
import com.bookstrap.model.dao.AccountLabelRepository;
import com.bookstrap.model.dao.AccountMailRepository;
import com.bookstrap.model.dao.MailAccountRepository;
import com.bookstrap.model.dao.MailAttachmentRepository;
import com.bookstrap.model.dao.MailCategoryRepository;
import com.bookstrap.model.dao.MailEMRepository;
import com.bookstrap.model.dao.MailFolderRepository;
import com.bookstrap.model.dao.MailRepository;
import com.bookstrap.model.pk.AccountMailPK;

@Service
@Transactional
public class MailService {
	private static Integer NUM_IN_PAGE = 10;
	
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
	
	@Autowired
	private MailCategoryRepository mailCategoryDao;
	
	@Autowired
	private EmployeesRepository empDao;
	
	@Autowired 
	private MailEMRepository emDao;
	
	public MailService() {
	}

// ================================================= for Counting =============================================================
	public Long getMailCountInFolder(Integer folderId, Integer accountId) {
		return accountMailDao.getMailCountInFolder(folderId, accountId);
	};
	public Long getMailCountInCategory(Integer categoryId, Integer accountId) {
		return accountMailDao.getMailCountInCategory(categoryId, accountId, "bin");
	};
	public Long getImportantMailCount(Integer accountId) {
		return accountMailDao.getImportantMailCount(accountId);
	};
	public Long getstarredMailCount(Integer accountId) {
		return accountMailDao.getstarredMailCount(accountId);
	};
	
	public Long getMailCountInLabel(Integer labelId, Integer accountId) {
		return accountMailDao.getLabelMailCount(labelId, accountId);
	}
	
	public Long getMailsCountByConditions(ConditionDto condition, Integer accountId) {
		return emDao.findMailsCountByConditions(condition, accountId);
	}
// ================================================= for Searching =============================================================
	public List<AccountMail> findAllUnreadMails(Integer accountId) {
		return accountMailDao.getUnreadMail(accountId);
	}
	public List<AccountLabel> findAllLabelByAccountId(Integer accountId) {
		return emDao.findAllLabelByAccountId(accountId);
	}
	
	public MailCategory findByCategoryName(String categoryName) {
		MailCategory category = mailCategoryDao.findByCategoryName(categoryName);
		return category;
	}
	
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
	
	public AccountMail findAccountMailBy2Id(Integer mailId, Integer accountId) {
		AccountMailPK accountMailPK = new AccountMailPK(mailId, accountId);
		Optional<AccountMail> mail = accountMailDao.findById(accountMailPK);
		if(mail.isEmpty()) return null;
		return mail.get();
	}
	
	
	
	
	public MailAttachment findMailAttachmentById(Integer mailAttachmentId) {
		Optional<MailAttachment> optional = attachmentDao.findById(mailAttachmentId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Page<AccountMail> findMailByFolderAndPage(MailAccount account,Integer folderId, Integer pageNum) {
		PageRequest pageRequest = PageRequest.of(pageNum - 1, NUM_IN_PAGE, Sort.by("mail_mailTime").descending());
		Optional<MailFolder> folder = mailFolderDao.findById(folderId);
		if (folder.isEmpty()) {
			return null;
		}
		Page<AccountMail> page = accountMailDao.findByMailAccountAndMailFolder(account, folder.get(), pageRequest);
		return page;
	}
	
	public Page<AccountMail> findMailByCategoryAndPage(MailAccount account,Integer categoryId, Integer pageNum) {
		PageRequest pageRequest = PageRequest.of(pageNum - 1, NUM_IN_PAGE, Sort.by("mail_mailTime").descending());
		Optional<MailCategory> category = mailCategoryDao.findById(categoryId);
		if (category.isEmpty()) {
			return null;
		}
		Page<AccountMail> page = accountMailDao.findByMailAccountAndMailCategoryAndMailFolder_FolderNameNot(account, category.get(), pageRequest,"bin");
		return page;
	}
	
	public Page<AccountMail> findMailByLabelAndPage(Integer labelId, Integer pageNum) {
		PageRequest pageRequest = PageRequest.of(pageNum - 1, NUM_IN_PAGE, Sort.by("mail_mailTime").descending());
		Page<AccountMail> page = accountMailDao.findByAccountLabelsLabelIdAndMailFolder_FolderNameNot(labelId, pageRequest, "bin");
		return page;
	}
	
	public Page<AccountMail> findMailByImportantOrStarredAndPage(String importantOrStarred, Integer pageNum){
		PageRequest pageRequest = PageRequest.of(pageNum - 1, NUM_IN_PAGE, Sort.by("mail_mailTime").descending());
		if (importantOrStarred.equals("important")) {
			Page<AccountMail> page = accountMailDao.findByImportant((short)1, pageRequest);
			return page;
		}else {
			Page<AccountMail> page = accountMailDao.findByStarred((short)1, pageRequest);
			return page;
		}
	}
	
	public List<AccountMail> findMailByConditions(ConditionDto conditions, Integer accountId, Integer pageNum){
		return emDao.findMailsByConditions(conditions, pageNum, accountId);
	}

	public LinkedHashSet<String> findAllSentAccount(Integer accountId) {
		return mailDao.findAllSentAccount(accountId);
	}
	
	public LinkedHashSet<String> findAllFromAccount(Integer accountId) {
		return mailDao.findAllFromAccount(accountId);
	}

	public LinkedHashMap<String,String> findAllAccountWithName() {
		LinkedHashMap<String, String> empAndAccount = new LinkedHashMap<String,String>();
		List<MailAccount> mailAccounts = mailAccountDao.findAll();
		for (MailAccount mailAccount : mailAccounts) {
			String empName = mailAccount.getEmployee().getEmpName();
			String account = mailAccount.getAccount();
			empAndAccount.put(empName, account);
		}
		return empAndAccount;
	}
// ================================================= for Inserting =============================================================
	public AccountLabel addLabel(MailAccount account, String labelName) {
		AccountLabel newLabel = new AccountLabel();
		newLabel.setLabelName(labelName);
		newLabel.setMailAccount(account);			
		return accountLabelDao.save(newLabel);
		
	} 
	
	
	public Mail sendMail(MailAccount mailFrom,SendMailDto mailDto) throws IOException, SQLException {
		MultipartFile[] files = mailDto.getFile();
		MailAccount mailTo = mailAccountDao.findByAccount(mailDto.getMailTo());
		if (mailTo == null) {
			throw new SQLException("no data found for MailAccount with account name: "+mailDto.getMailTo());
		}
		// folder 1:inbox, 2:sent, 3:draft, 4: delete
		String mailContent = mailDto.getMailContent();
		AntiSamy antiSamy = new AntiSamy();
		try {
			CleanResults cr = antiSamy.scan(mailContent,"src/main/webapp/eddie/antisamy-myspace.xml");
			mailContent = cr.getCleanHTML();
//			System.out.println("=================================================================================================");
//			System.out.println(mailContent);
		} catch (ScanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (PolicyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
        
        
        
        
		//add mail
		Mail mail = new Mail();
		mail.setAccountFrom(mailFrom);
		mail.setAccountTo(mailTo);		
		mail.setMailSubject(mailDto.getMailSubject());
//		mail.setMailContent(mailDto.getMailContent());
		mail.setMailContent(mailContent);
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
		from.setHasread((short)1);
		to.setMailFolder(mailFolderDao.findById(1).get());
		MailCategory category = mailCategoryDao.findByCategoryName(mailDto.getMailCategory());
		if (category == null) {
			category = mailCategoryDao.findByCategoryName("normal");
		}
		from.setMailCategory(category);
		to.setMailCategory(category);
		
		
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
		from.setHasread((short)1);
		from.onCreate();
		from.setMailfrom((short)1);		
		from.setMailFolder(mailFolderDao.findById(3).get());
		MailCategory category = mailCategoryDao.findByCategoryName(mailDto.getMailCategory());
		if (category == null) {
			category = mailCategoryDao.findByCategoryName("normal");
		}
		from.setMailCategory(category);
		
		accountMailDao.save(from);
		return newMail;		
	}
// ================================================= for Updating =============================================================
	public AccountMail setHasread(Short hasread,Integer mailId,Integer accountId) {
		AccountMailPK accountMailPK = new AccountMailPK(mailId,accountId);
		Optional<AccountMail> optional = accountMailDao.findById(accountMailPK);
		if (optional.isPresent()) {
			AccountMail mail = optional.get();
			mail.setHasread(hasread);
			return accountMailDao.save(mail);
		}
		return null;
	}
	
	public Integer setHasreads(Short hasread,Integer[] mailIds,Integer accountId) {
		Integer count = 0;
		for (Integer mailId : mailIds) {
			AccountMailPK accountMailPK = new AccountMailPK(mailId,accountId);
			Optional<AccountMail> optional = accountMailDao.findById(accountMailPK);
			if (optional.isEmpty()) continue;
			AccountMail mail = optional.get();
			mail.setHasread(hasread);
			accountMailDao.save(mail);
			count += 1;
		}
		return count;
	}
	
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
	
	public Integer[] setFolder(Integer folderId, Integer[] mailIds, Integer accountId) {
		Optional<MailFolder> optionalf = mailFolderDao.findById(folderId);
		if (mailIds.length == 0 || optionalf.isEmpty()) return null;
		MailFolder folder = optionalf.get();
		ArrayList<Integer> updatedIds = new ArrayList<Integer>();
		for (Integer mailId : mailIds) {
			Optional<AccountMail> optional = accountMailDao.findById(new AccountMailPK(mailId,accountId));
			if (optional.isPresent()) {
				AccountMail mail = optional.get();
				mail.setMailFolder(folder);	
				accountMailDao.save(mail);
				updatedIds.add(mailId);
			}
		}
		return updatedIds.size() == 0 ? null : updatedIds.toArray(new Integer[updatedIds.size()]);
	}
	
	public Integer addLabelToMail(Integer labelId, Integer[] mailIds, Integer accountId) {
		return emDao.addLabelToMail(labelId, mailIds, accountId);
	}
	
	public Integer setLabelsToMails(Integer[] labelIds, Integer[] mailIds, Integer accountId) {
		return emDao.setLabelsToMails(labelIds, mailIds, accountId);
	}
//================================================= for Deleting =============================================================
	public boolean deleteLabel(Integer labelId) {
		Optional<AccountLabel> optional = accountLabelDao.findById(labelId);
		if (optional.isPresent()) {
			AccountLabel accountLabel = optional.get();
			Set<AccountMail> mails = accountLabel.getAccountMails();
			if (mails != null) {
				for (AccountMail mail : mails) {
					AccountMail newMail = new AccountMail();
					BeanUtils.copyProperties(mail, newMail); // avoid ConcurrentModificationException
					newMail.removeAccountLabel(accountLabel);
					accountMailDao.save(newMail);
				}
			}
			accountLabelDao.deleteById(labelId);			
			return true;
		}
		return false;
	}
	
	public Integer[] deleteMail(Integer accountId, Integer[] mailIds) {
		ArrayList<Integer> deleted = new ArrayList<Integer>();
		for (Integer mailId : mailIds) {
			AccountMailPK accountMailPK = new AccountMailPK(mailId, accountId);
			Optional<AccountMail> optional = accountMailDao.findById(accountMailPK);
			if (optional.isEmpty()) continue;
			AccountMail mail = optional.get();
			Mail rootMail = mail.getMail();
			Set<AccountMail> accountMails = rootMail.getAccountMails();
			if (accountMails.size() == 1) {
				mailDao.delete(rootMail);
				deleted.add(mailId);
			}else {
				accountMails.remove(mail);
				rootMail.setAccountMails(accountMails);
				mailDao.save(rootMail);
				accountMailDao.delete(mail);
				deleted.add(mailId);							
			}
		}
		return deleted.toArray(new Integer[deleted.size()]);
		
	}
	
}
