package com.bookstrap.model.bean;




import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="Mail")
public class Mail {
	
	@Id
	@Column(name = "mail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mailId;
	
	@OneToOne
	@JoinColumn(name = "mail_from")
	private MailAccount accountFrom;
	
	@OneToOne
	@JoinColumn(name = "mail_to")
	private MailAccount accountTo;
	
	@Temporal(TemporalType.TIMESTAMP) // sql.Date這個不用寫
	@Column(name = "mail_time")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date mailTime; //probably need more settings
	
	@Column(name = "mail_subject")
	private String mailSubject;
	
	@Column(name = "mail_content")
	private String mailContent;
	

	@PrePersist //things to do before  into persistent state
	public void onCreate() {
		if (mailTime == null) {
			mailTime = new Date();
		}
	}
	//  ==========================RELATION COLUMNS==========================  // 
	
	@OneToMany(mappedBy = "mail")
	@JsonManagedReference
	private Set<MailAttachment> mailAttachment;
	
	@OneToMany(mappedBy = "mail")
	@JsonManagedReference
	private Set<AccountMail> accountMails;
	
	@ManyToMany
	@JoinTable(name = "MailAccountLabel", joinColumns = {@JoinColumn(name="mail_id", referencedColumnName = "mail_id")},
	inverseJoinColumns = {@JoinColumn(name = "label_id", referencedColumnName = "label_id")})
	private Set<AccountLabel> accountLabels;
	
	
	public Mail() {
	}
//===================GETTERS AND SETTERS =====================//



	public Integer getMailId() {
		return mailId;
	}



	public MailAccount getAccountFrom() {
		return accountFrom;
	}



	public MailAccount getAccountTo() {
		return accountTo;
	}



	public Date getMailTime() {
		return mailTime;
	}



	public String getMailSubject() {
		return mailSubject;
	}



	public String getMailContent() {
		return mailContent;
	}



	public Set<MailAttachment> getMailAttachment() {
		return mailAttachment;
	}



	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}



	public void setAccountFrom(MailAccount accountFrom) {
		this.accountFrom = accountFrom;
	}



	public void setAccountTo(MailAccount accountTo) {
		this.accountTo = accountTo;
	}



	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}



	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}



	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}



	public void setMailAttachment(Set<MailAttachment> mailAttachment) {
		this.mailAttachment = mailAttachment;
	}



	public Set<AccountMail> getAccountMails() {
		return accountMails;
	}



	public void setAccountMails(Set<AccountMail> accountMails) {
		this.accountMails = accountMails;
	}



	public Set<AccountLabel> getAccountLabels() {
		return accountLabels;
	}



	public void setAccountLabels(Set<AccountLabel> accountLabels) {
		this.accountLabels = accountLabels;
	}
	
}
