package com.bookstrap.model.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.pk.AccountMailPK;

public interface AccountMailRepository extends JpaRepository<AccountMail, AccountMailPK> {
	public Set<AccountMail> findByMailAccountAndMailfrom(MailAccount mailAccount,Short num);
}
