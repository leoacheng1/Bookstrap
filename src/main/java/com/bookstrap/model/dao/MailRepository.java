package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.Mail;

public interface MailRepository extends JpaRepository<Mail, Integer> {
}
