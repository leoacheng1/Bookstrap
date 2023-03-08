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
import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@JsonIgnore
	@Column(name = "attachment_file")
	private byte[] attachmentFile;
	
	@Column(name = "attachment_name")
	private String attachmentName;
	
	@Column(name = "attachment_type")
	private String attachmentType;
	
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

	public String getAttachmentName() {
		return attachmentName;
	}

	public String getAttachmentType() {
		return attachmentType;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

}
