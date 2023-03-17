package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.MailAttachment;

public interface MailAttachmentRepository extends JpaRepository<MailAttachment, Integer> {
	
}
