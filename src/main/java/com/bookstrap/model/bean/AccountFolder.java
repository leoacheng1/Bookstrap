package com.bookstrap.model.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.bookstrap.model.pk.AccountFolderPK;
import com.fasterxml.jackson.annotation.JsonBackReference;

public class AccountFolder {
	
	
	@EmbeddedId
	private AccountFolderPK accountFolderId;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "account_id", insertable = false, updatable = false)
	private MailAccount mailAccount;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "folder_id", insertable = false, updatable = false)
	private MailFolder mailFolder;
	
	public AccountFolder() {
	
	}


	public AccountFolderPK getAccountFolderId() {
		return accountFolderId;
	}


	public void setAccountFolderId(AccountFolderPK accountFolderId) {
		this.accountFolderId = accountFolderId;
	}


	public MailAccount getMailAccount() {
		return mailAccount;
	}


	public void setMailAccount(MailAccount mailAccount) {
		this.mailAccount = mailAccount;
	}


	public MailFolder getMailFolder() {
		return mailFolder;
	}


	public void setMailFolder(MailFolder mailFolder) {
		this.mailFolder = mailFolder;
	}



}
