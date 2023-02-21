package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="MailAttachment")
public class MailAttachment {
	
	@Id
	@Column(name = "attachment_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer attachmentId;
	
	@ManyToOne
	@JoinColumn(name = "mail_id")
	@JsonBackReference
	private Mail mail;
	
	@Column(name = "mail_id")
	@Transient
	private Integer mailId;
		
	@Lob
	@Column(name = "attachment_file")
	private byte[] attachmentFile;
	
	public MailAttachment() {
	}

	public Integer getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Integer attachmentId) {
		this.attachmentId = attachmentId;
	}

	public Mail getMail() {
		return mail;
	}

	public void setMail(Mail mail) {
		this.mail = mail;
	}

	public byte[] getAttachmentFile() {
		return attachmentFile;
	}

	public void setAttachmentFile(byte[] attachmentFile) {
		this.attachmentFile = attachmentFile;
	}

	public Integer getMailId() {
		return mailId;
	}

	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}

}
