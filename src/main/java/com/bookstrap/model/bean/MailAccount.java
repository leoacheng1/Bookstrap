package com.bookstrap.model.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="MailAccount")
public class MailAccount {
	
	@Id
	@Column(name = "account_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer accountId;

	@Column(name = "account")
	private String account;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "activated")
	private Short activated;
	
	@OneToOne
	@JoinColumn(name = "employee_id")
	private Employees employee;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "mailAccount", cascade = CascadeType.ALL)
	private Set<AccountLabel> accountLabels;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "mailAccount", cascade = CascadeType.ALL)
	private Set<AccountMail> accountMails;
	
	public MailAccount() {
	}
	
	public Set<AccountLabel> getAccountLabels() {
		return accountLabels;
	}

	public void setAccountLabels(Set<AccountLabel> accountLabels) {
		this.accountLabels = accountLabels;
	}


	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Short getActivated() {
		return activated;
	}

	public void setActivated(Short activated) {
		this.activated = activated;
	}

	public Employees getEmployee() {
		return employee;
	}

	public void setEmployee(Employees employee) {
		this.employee = employee;
	}

	public Set<AccountMail> getAccountMails() {
		return accountMails;
	}

	public void setAccountMails(Set<AccountMail> accountMails) {
		this.accountMails = accountMails;
	}
	
}
