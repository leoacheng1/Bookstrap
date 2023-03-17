package com.bookstrap.model.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MailCountDto {

	@JsonProperty
	private Long inboxCount = 0L;
	
	@JsonProperty
	private Long sentCount = 0L;
	
	@JsonProperty
	private Long draftCount = 0L;
	
	@JsonProperty
	private Long binCount = 0L;
	
	@JsonProperty
	private Long normalCount = 0L;
	
	@JsonProperty
	private Long workCount = 0L;
	
	@JsonProperty
	private Long companyCount = 0L;
	
	@JsonProperty
	private Long importantCount = 0L;
	
	@JsonProperty
	private Long starredCount = 0L;

	public MailCountDto() {
	}

	public Long getInboxCount() {
		return inboxCount;
	}

	public Long getSentCount() {
		return sentCount;
	}

	public Long getDraftCount() {
		return draftCount;
	}

	public Long getBinCount() {
		return binCount;
	}

	public Long getNormalCount() {
		return normalCount;
	}

	public Long getWorkCount() {
		return workCount;
	}

	public Long getCompanyCount() {
		return companyCount;
	}

	public Long getImportantCount() {
		return importantCount;
	}

	public Long getStarredCount() {
		return starredCount;
	}

	public void setInboxCount(Long inboxCount) {
		this.inboxCount = inboxCount;
	}

	public void setSentCount(Long sentCount) {
		this.sentCount = sentCount;
	}

	public void setDraftCount(Long draftCount) {
		this.draftCount = draftCount;
	}

	public void setBinCount(Long binCount) {
		this.binCount = binCount;
	}

	public void setNormalCount(Long normalCount) {
		this.normalCount = normalCount;
	}

	public void setWorkCount(Long workCount) {
		this.workCount = workCount;
	}

	public void setCompanyCount(Long companyCount) {
		this.companyCount = companyCount;
	}

	public void setImportantCount(Long importantCount) {
		this.importantCount = importantCount;
	}

	public void setStarredCount(Long starredCount) {
		this.starredCount = starredCount;
	}

}
