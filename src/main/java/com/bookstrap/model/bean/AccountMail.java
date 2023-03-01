package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bookstrap.model.pk.AccountMailPK;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "AccountMail")
public class AccountMail {

	@EmbeddedId
	private AccountMailPK accountMailId;

	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name = "account_id", insertable = false, updatable = false)
	private MailAccount mailAccount;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "mail_id", insertable = false, updatable = false)
	private Mail mail;
	
	@Column(name = "starred")
	private Short starred ;
	
	@Column(name = "important")
	private Short important;
	
	@Column(name = "hasread")
	private Short hasread;
	
	@Column(name = "folder_id")
	@Transient
	private Integer folderId;
	
	@Column(name = "category_id")
	@Transient
	private Integer categoryId;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name = "folder_id")
	private MailFolder mailFolder;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name = "category_id")
	private MailCategory mailCategory;
	
	@Column(name = "mailfrom")
	private Short mailfrom;
	
	@PrePersist //things to do before  into persistent state
	public void onCreate() {
		if (starred == null) starred = 0;
		if (important == null) important = 0;
		if (hasread == null) hasread = 0;		
	}

	public AccountMailPK getAccountMailId() {
		return accountMailId;
	}

	public MailAccount getMailAccount() {
		return mailAccount;
	}

	public Mail getMail() {
		return mail;
	}

	public Short getStarred() {
		return starred;
	}

	public Short getImportant() {
		return important;
	}

	public Short getHasread() {
		return hasread;
	}

	public Integer getFolderId() {
		return folderId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public MailFolder getMailFolder() {
		return mailFolder;
	}

	public MailCategory getMailCategory() {
		return mailCategory;
	}

	public void setAccountMailId(AccountMailPK accountMailId) {
		this.accountMailId = accountMailId;
	}

	public void setMailAccount(MailAccount mailAccount) {
		this.mailAccount = mailAccount;
	}

	public void setMail(Mail mail) {
		this.mail = mail;
	}

	public void setStarred(Short starred) {
		this.starred = starred;
	}

	public void setImportant(Short important) {
		this.important = important;
	}

	public void setHasread(Short hasread) {
		this.hasread = hasread;
	}

	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public void setMailFolder(MailFolder mailFolder) {
		this.mailFolder = mailFolder;
	}

	public void setMailCategory(MailCategory mailCategory) {
		this.mailCategory = mailCategory;
	}

	public Short getMailfrom() {
		return mailfrom;
	}

	public void setMailfrom(Short mailfrom) {
		this.mailfrom = mailfrom;
	}
}
