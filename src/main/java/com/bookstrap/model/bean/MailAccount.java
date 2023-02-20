package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
	private Byte activated;
	
	@OneToOne
	@JoinColumn(name = "employee_id")
	private Employees employee;
	
	public MailAccount() {
	}

}
