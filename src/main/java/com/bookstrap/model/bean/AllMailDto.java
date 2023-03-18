package com.bookstrap.model.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AllMailDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@JsonProperty
	private Short starred;
	
	@JsonProperty
	private Short important;
	
	@JsonProperty
	private Short hasread;

	@JsonProperty
	private String from;
	
	@JsonProperty
	private String fromLink;
	
	@JsonProperty
	private String subject;
	
	@JsonProperty
	private String mailLink;
	
	@JsonProperty
	private Integer mailId;
	
	@JsonProperty
	private Integer[] attachmentIds;
	
	@JsonProperty
	private String mailContent;
	
	@JsonProperty
	private List<AccountLabel> mailLabels;
	
	@JsonProperty
	private MailCategory mailCategory;
	
	@JsonProperty
	private MailFolder mailFolder;
	
	@JsonProperty
	@Temporal(TemporalType.TIMESTAMP) 
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date mailTime; 
	
	public AllMailDto() {
	}



	public AllMailDto(Short starred, Short important, Short hasread, String from, String fromLink, String subject,
			String mailLink, Integer mailId, Integer[] attachmentIds, String mailContent, List<AccountLabel> mailLabels,
			MailCategory mailCategory, MailFolder mailFolder, Date mailTime) {
		super();
		this.starred = starred;
		this.important = important;
		this.hasread = hasread;
		this.from = from;
		this.fromLink = fromLink;
		this.subject = subject;
		this.mailLink = mailLink;
		this.mailId = mailId;
		this.attachmentIds = attachmentIds;
		this.mailContent = mailContent;
		this.mailLabels = mailLabels;
		this.mailCategory = mailCategory;
		this.mailFolder = mailFolder;
		this.mailTime = mailTime;
	}



	public Short getHasread() {
		return hasread;
	}


	public void setHasread(Short hasread) {
		this.hasread = hasread;
	}


	public Short getStarred() {
		return starred;
	}

	public Short getImportant() {
		return important;
	}

	public String getFrom() {
		return from;
	}

	public String getFromLink() {
		return fromLink;
	}

	public String getSubject() {
		return subject;
	}

	public String getMailLink() {
		return mailLink;
	}

	public Date getMailTime() {
		return mailTime;
	}

	public void setStarred(Short starred) {
		this.starred = starred;
	}

	public void setImportant(Short important) {
		this.important = important;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public void setFromLink(String fromLink) {
		this.fromLink = fromLink;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setMailLink(String mailLink) {
		this.mailLink = mailLink;
	}

	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}


	public Integer getMailId() {
		return mailId;
	}


	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}


	public Integer[] getAttachmentIds() {
		return attachmentIds;
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



	public List<AccountLabel> getMailLabels() {
		return mailLabels;
	}



	public void setMailLabels(List<AccountLabel> mailLabels) {
		this.mailLabels = mailLabels;
	}



	public MailCategory getMailCategory() {
		return mailCategory;
	}

	public MailFolder getMailFolder() {
		return mailFolder;
	}

	public void setMailCategory(MailCategory mailCategory) {
		this.mailCategory = mailCategory;
	}

	public void setMailFolder(MailFolder mailFolder) {
		this.mailFolder = mailFolder;
	}

}