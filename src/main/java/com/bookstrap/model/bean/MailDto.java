package com.bookstrap.model.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MailDto implements Serializable{
	//for receiving sending mail request
	private static final long serialVersionUID = 1L;
	@JsonProperty("mailTo")
	private String mailTo;
	
	@JsonProperty("mailSubject")
	private String mailSubject;
	
	@JsonProperty("mailContent")
	private String mailContent;
	
	@JsonProperty("starred")
	private Byte starred;
	
	@JsonProperty("important")
	private Byte important;
	
	@JsonProperty("hasread")
	private Byte hasread;
	
	private MultipartFile[] file;
	public MailDto() {
		
	}

	public String getMailTo() {
		return mailTo;
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public String getMailContent() {
		return mailContent;
	}

	public Byte getStarred() {
		return starred;
	}

	public Byte getImportant() {
		return important;
	}

	public Byte getHasread() {
		return hasread;
	}



	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public void setStarred(Byte starred) {
		this.starred = starred;
	}

	public void setImportant(Byte important) {
		this.important = important;
	}

	public void setHasread(Byte hasread) {
		this.hasread = hasread;
	}

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}



}
