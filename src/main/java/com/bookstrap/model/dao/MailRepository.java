package com.bookstrap.model.dao;

import java.util.LinkedHashSet;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.Mail;

public interface MailRepository extends JpaRepository<Mail, Integer> {
	
//	@Query("SELECT mail.accountFrom.account FROM Mail mail WHERE mail.accountTo.accountId = :aid")
//	public LinkedHashSet<String> findAllSentAccount(@Param("aid") Integer accountId);
	
	@Query("SELECT accmail.mail.accountFrom.account FROM AccountMail accmail WHERE accmail.mailAccount.accountId = :aid AND accmail.mailfrom = 0")
	public LinkedHashSet<String> findAllSentAccount(@Param("aid") Integer accountId);
	
	@Query("SELECT accmail.mail.accountTo.account FROM AccountMail accmail WHERE accmail.mailAccount.accountId = :aid AND accmail.mailfrom = 1")
	public LinkedHashSet<String> findAllFromAccount(@Param("aid") Integer accountId);
	

}

