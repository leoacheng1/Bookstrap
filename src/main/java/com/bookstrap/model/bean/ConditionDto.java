package com.bookstrap.model.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ConditionDto {
	
	@JsonProperty
	private String sentBy;
	
	@JsonProperty
	private String sentTo;
	
	@JsonProperty
	private String subject;
	
	@JsonProperty
	private String content;
	
	@JsonProperty
	private Date startDate;
	
	@JsonProperty
	private Date endDate;
	
	@JsonProperty
	private String folderName;
	
	@JsonProperty
	private String categoryName;
	
	@JsonProperty
	private Integer labelId;
	
	@JsonProperty
	private Short hasread;
	
	@JsonProperty
	private Integer hasAttachment;
	
	@JsonProperty
	private Short important;
	
	@JsonProperty
	private Short starred;
	
	
	public ConditionDto() {
	}
	
	
	public ConditionDto(String sentBy, String sentTo, String subject, String content, Date startDate, Date endDate,
			String folderName, String categoryName, Integer labelId, Short hasread, Integer hasAttachment,
			Short important, Short starred) {
		super();
		this.sentBy = sentBy;
		this.sentTo = sentTo;
		this.subject = subject;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.folderName = folderName;
		this.categoryName = categoryName;
		this.labelId = labelId;
		this.hasread = hasread;
		this.hasAttachment = hasAttachment;
		this.important = important;
		this.starred = starred;
	}







	public String getSentBy() {
		return sentBy;
	}

	public String getSentTo() {
		return sentTo;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public String getFolderName() {
		return folderName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public Integer getLabelId() {
		return labelId;
	}

	public Short getHasread() {
		return hasread;
	}

	public Integer getHasAttachment() {
		return hasAttachment;
	}

	public Short getImportant() {
		return important;
	}

	public void setSentBy(String sentBy) {
		this.sentBy = sentBy;
	}

	public void setSentTo(String sentTo) {
		this.sentTo = sentTo;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}

	public void setHasread(Short hasread) {
		this.hasread = hasread;
	}

	public void setHasAttachment(Integer hasAttachment) {
		this.hasAttachment = hasAttachment;
	}

	public void setImportant(Short important) {
		this.important = important;
	}

	public Short getStarred() {
		return starred;
	}

	public void setStarred(Short starred) {
		this.starred = starred;
	}
	
}
