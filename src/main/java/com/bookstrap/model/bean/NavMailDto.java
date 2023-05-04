package com.bookstrap.model.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class NavMailDto implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonProperty
	private Integer mailId;

	@JsonProperty
	private String empName;

	@JsonProperty
	private String empAccount;

	@JsonProperty
	private String mailSubject;
	
	@JsonProperty
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy年MM月dd日 aHH:mm", timezone = "GMT+8")
	private Date mailTime;




	public NavMailDto(Integer mailId, String empName, String empAccount, String mailSubject, Date mailTime) {
		super();
		this.mailId = mailId;
		this.empName = empName;
		this.empAccount = empAccount;
		this.mailSubject = mailSubject;
		this.mailTime = mailTime;
	}

	public NavMailDto() {
	}

	public Integer getMailId() {
		return mailId;
	}

	public String getEmpName() {
		return empName;
	}



	public String getEmpAccount() {
		return empAccount;
	}

	public void setEmpAccount(String empAccount) {
		this.empAccount = empAccount;
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public Date getMailTime() {
		return mailTime;
	}

	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}



	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}


}
