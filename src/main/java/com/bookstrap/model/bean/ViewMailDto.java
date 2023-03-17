package com.bookstrap.model.bean;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ViewMailDto {
	@JsonProperty
	private String mailSubject;
	
	@JsonProperty
	private String mailContent;
	
	@JsonProperty
	private String mailFrom;
	
	@JsonProperty
	@Temporal(TemporalType.TIMESTAMP) 
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date mailTime; 
	
	@JsonProperty
	private Integer[] attachmentIds;
	
	public ViewMailDto() {
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public String getMailFrom() {
		return mailFrom;
	}
	
	public Date getMailTime() {
		return mailTime;
	}

	public Integer[] getAttachmentIds() {
		return attachmentIds;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}

	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}

	public void setAttachmentIds(Integer[] attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	
}
