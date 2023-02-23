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





	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}


	

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}



}
