package com.bookstrap.model.bean;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="MailFolder")
public class MailFolder {
	
	@Id
	@Column(name="folder_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer folderId;
	
	@Column(name="folder_name")
	private String folderName;
	
	
	@OneToMany(mappedBy="mailFolder", orphanRemoval = true)
	@JsonBackReference
	private Set<AccountMail> accountMails;
	
	
	public Integer getFolderId() {
		return folderId;
	}

	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public MailFolder() {
	}

	public Set<AccountMail> getAccountMails() {
		return accountMails;
	}

	public void setAccountMails(Set<AccountMail> accountMails) {
		this.accountMails = accountMails;
	}



}
