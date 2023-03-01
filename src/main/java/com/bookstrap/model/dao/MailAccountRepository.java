package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.Employees;
import com.bookstrap.model.bean.MailAccount;

public interface MailAccountRepository extends JpaRepository<MailAccount, Integer> {
	public MailAccount findByEmployee(Employees employee);
	
	public MailAccount findByAccount(String account);

}
