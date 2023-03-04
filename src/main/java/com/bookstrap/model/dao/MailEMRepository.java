package com.bookstrap.model.dao;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.bean.AccountMail;
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
			Set<AccountLabel> labels = mail.getAccountLabels();
			labels.add(label);
			mail.setAccountLabels(labels);
			em.merge(mail);
			count ++;
		}
		return count;
		
	
	}
}
