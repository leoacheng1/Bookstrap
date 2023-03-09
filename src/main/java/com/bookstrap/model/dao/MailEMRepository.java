package com.bookstrap.model.dao;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.ConditionDto;
import com.bookstrap.model.pk.AccountMailPK;

@Repository
public class MailEMRepository {

	@PersistenceContext
	private EntityManager em;
	
	public MailEMRepository() {
	}
	
	public List<AccountLabel> findAllLabelByAccountId(Integer accountId) {
		TypedQuery<AccountLabel> query = em.createQuery("from AccountLabel label WHERE mailAccount.accountId =:accountId", AccountLabel.class);
		return query.setParameter("accountId",accountId).getResultList();
	}
	
	public Integer addLabelToMail(Integer labelId, Integer[] mailIds, Integer accountId) {
		Integer count = 0;
		for (Integer mailId : mailIds) {
			AccountMailPK accountMailPK = new AccountMailPK(mailId, accountId);
			AccountMail mail = em.find(AccountMail.class, accountMailPK);
			AccountLabel label = em.find(AccountLabel.class, labelId);
			if (mail == null || label == null) continue; //maybe some handling later
			List<AccountLabel> labels = mail.getAccountLabels();
			labels.add(label);
			mail.setAccountLabels(labels);
			em.merge(mail);
			count ++;
		}
		return count;
	}
	
	public Integer setLabelsToMails(Integer[] labelIds, Integer[] mailIds, Integer accountId) {
		Integer count = 0;
		List<AccountLabel> labels = new LinkedList<AccountLabel>();
		for (Integer labelId : labelIds) {
			AccountLabel label = em.find(AccountLabel.class, labelId);
			if (label == null) continue;
			labels.add(label);
		}
		
		for (Integer mailId : mailIds) {
			AccountMailPK accountMailPK = new AccountMailPK(mailId, accountId);
			AccountMail mail = em.find(AccountMail.class, accountMailPK);
			if (mail == null) continue; //maybe some handling later
			mail.setAccountLabels(labels);
			em.merge(mail);
			count ++;
		}
		return count;
	}
	
	public List<AccountMail> findMailsByConditions(ConditionDto conditions, Integer pageNum, Integer accountId){
		String basicQuery = "SELECT aMail From AccountMail aMail WHERE aMail.accountMailId.accountId = :accountId";
		
		
		//building query 
		if (conditions.getHasread() == 0 || conditions.getHasread() == 1) basicQuery += (" AND aMail.hasread = :hasread");
		if (conditions.getCategoryName().length() > 0) basicQuery += (" AND aMail.mailCategory.categoryName =:categoryName");
		if (conditions.getFolderName().length() > 0) basicQuery += (" AND aMail.mailFolder.folderName =:folderName");
		if (conditions.getLabelId() != -1) basicQuery += (" AND :label MEMBER OF aMail.accountLabels");
		if (conditions.getStartDate()!=null && conditions.getEndDate() != null) basicQuery += (" AND aMail.mail.mailTime BETWEEN :startDate AND :endDate");
		if (conditions.getSentBy().length() != 0) basicQuery += (" AND aMail.mail.accountFrom.account = :sentBy");
		if (conditions.getHasAttachment() != -1) basicQuery += (" AND SIZE(aMail.mail.mailAttachment) != 0");
		if (conditions.getContent().length() != 0 && conditions.getSubject().length() != 0) {
			basicQuery += (" AND (aMail.mail.mailContent LIKE :content OR aMail.mail.mailSubject LIKE :subject)");
		}else if (conditions.getContent().length() != 0) {
			basicQuery += (" AND aMail.mail.mailContent LIKE :content");
		}else if (conditions.getSubject().length() != 0) {
			basicQuery += (" AND aMail.mail.mailSubject LIKE :subject");
		}
		
		System.out.println("============================================================================================");
		System.out.println(basicQuery);
		TypedQuery<AccountMail> query = em.createQuery(basicQuery, AccountMail.class);
		
		
		//paging settings
		int pageSize = 10;
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		query.setParameter("accountId", accountId);
		
		//setting query param
		if (conditions.getHasread() == 0 || conditions.getHasread() == 1) query.setParameter("hasread", conditions.getHasread());
		if (conditions.getCategoryName().length() > 0) query.setParameter("categoryName", conditions.getCategoryName());
		if (conditions.getFolderName().length() > 0) query.setParameter("folderName", conditions.getFolderName());
		if (conditions.getLabelId() != -1) {
			AccountLabel label = em.find(AccountLabel.class, conditions.getLabelId());
			if (label == null) return null;
			query.setParameter("label", label);
		}
		if (conditions.getStartDate()!=null && conditions.getEndDate() != null) {
			query.setParameter("startDate",conditions.getStartDate());
			query.setParameter("endDate",conditions.getEndDate());
		}
		if (conditions.getSentBy().length() != 0) query.setParameter("sentBy", conditions.getSentBy());
		if (conditions.getContent().length() != 0 && conditions.getSubject().length() != 0) {
			query.setParameter("content", "%"+conditions.getContent()+"%");
			query.setParameter("subject", "%"+conditions.getSubject()+"%");
		}else if (conditions.getContent().length() != 0) {
			query.setParameter("content", "%"+conditions.getContent()+"%");
		}else if (conditions.getSubject().length() != 0) {
			query.setParameter("subject", "%"+conditions.getSubject()+"%");
		}
		List<AccountMail> result = query.getResultList();
		return result;
	}
	
}
