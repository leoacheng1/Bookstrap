package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.Transient;

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
	@JoinColumn(name = "account_id")
	private MailAccount mailAccount;
	
	@Column(name = "account_id")
	@Transient
	private Integer accountId;
	
	public AccountLabel() {
	}

}
