package com.bookstrap.model.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.pk.AccountMailPK;

public interface AccountMailRepository extends JpaRepository<AccountMail, AccountMailPK> {
	
	public Page<AccountMail> findByFolderId(Integer folderId ,Pageable pageable);
	
	public Page<AccountMail> findByCategoryId(Integer categoryId, Pageable pageable);
	
//	public Page<AccountMail> findByLabelId(Integer categoryId, Pageable pageable);
	
	public Set<AccountMail> findByMailAccountAndMailfrom(MailAccount mailAccount,Short num);
	
	@Query("SELECT COUNT(mail) FROM AccountMail mail WHERE mail.mailFolder.folderId=:fid AND mailAccount.id=:aid")
	public Long getMailCountInFolder(@Param("fid") Integer folderId, @Param("aid") Integer accountId);
	
	@Query("SELECT COUNT(mail) FROM AccountMail mail WHERE mail.mailCategory.categoryId=:cid AND mailAccount.id=:aid")
	public Long getMailCountInCategory(@Param("cid") Integer categoryId, @Param("aid") Integer accountId);
	
	@Query("SELECT COUNT(mail) FROM AccountMail mail WHERE mail.important=1 AND mailAccount.id=:aid")
	public Long getImportantMailCount(@Param("aid") Integer accountId);

	@Query("SELECT COUNT(mail) FROM AccountMail mail WHERE mail.starred=1 AND mailAccount.id=:aid")
	public Long getstarredMailCount(@Param("aid") Integer accountId);
	
	@Query("SELECT mail FROM AccountMail mail WHERE mail.mailCategory.categoryId=:cid AND mailAccount.id=:aid")
	public List<AccountMail> getMailInCategory(@Param("cid") Integer categoryId, @Param("aid") Integer accountId);
	
	@Query("SELECT mail FROM AccountMail mail WHERE mail.mailFolder.folderId=:fid AND mailAccount.id=:aid")
	public List<AccountMail> getMailInFolder(@Param("fid") Integer folderId, @Param("aid") Integer accountId);
	
	@Query("SELECT mail FROM AccountMail mail WHERE mail.important=1 AND mailAccount.id=:aid")
	public List<AccountMail> getImportantMail(@Param("aid") Integer accountId);
	
	@Query("SELECT mail FROM AccountMail mail WHERE mail.starred=1 AND mailAccount.id=:aid")
	public List<AccountMail> getstarredMail(@Param("aid") Integer accountId);
	
}
