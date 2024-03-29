package com.bookstrap.model.bean;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="AccountLabel")
public class AccountLabel {
	
	@Id
	@Column(name = "label_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer labelId;
	
	@Column(name = "label_name")
	private String labelName;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "account_id")
	private MailAccount mailAccount;
	
	@Column(name = "account_id")
	@Transient
	private Integer accountId;
	
	@ManyToMany(mappedBy = "accountLabels")
	@JsonBackReference
	private Set<AccountMail> accountMails;
    
	public AccountLabel() {
	}

	public Integer getLabelId() {
		return labelId;
	}

	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}

	public String getLabelName() {
		return labelName;
	}

	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}

	public MailAccount getMailAccount() {
		return mailAccount;
	}

	public void setMailAccount(MailAccount mailAccount) {
		this.mailAccount = mailAccount;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Set<AccountMail> getAccountMails() {
		return accountMails;
	}

	public void setAccountMails(Set<AccountMail> accountMails) {
		this.accountMails = accountMails;
	}

}
