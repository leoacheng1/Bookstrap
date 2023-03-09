package com.bookstrap.model.dao;

import java.util.LinkedHashSet;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.Mail;

public interface MailRepository extends JpaRepository<Mail, Integer> {
	@Query("SELECT mail.accountFrom.account FROM Mail mail WHERE mail.accountTo.accountId = :aid")
	public LinkedHashSet<String> findAllSentAccount(@Param("aid") Integer accountId);
}

