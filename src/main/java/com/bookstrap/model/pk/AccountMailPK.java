package com.bookstrap.model.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class AccountMailPK implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Column(name = "mail_id")
	private Integer mailId;
	
	@Column(name = "account_id")
	private Integer accountId;
	
	
	public AccountMailPK() {
	}


	public AccountMailPK(Integer mailId, Integer accountId) {
		this.mailId = mailId;
		this.accountId = accountId;
	}


	public Integer getMailId() {
		return mailId;
	}


	public Integer getAccountId() {
		return accountId;
	}


	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}


	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}


}
