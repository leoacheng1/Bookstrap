package com.bookstrap.model.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.bookstrap.model.bean.MailAccount;
import com.bookstrap.model.bean.MailFolder;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Embeddable
public class AccountFolderPK implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "account_id")
	private Integer accountId;
	
	@Column(name = "folder_id")
	private Integer folderId;
	
	public AccountFolderPK() {
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getFolderId() {
		return folderId;
	}

	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}



}
