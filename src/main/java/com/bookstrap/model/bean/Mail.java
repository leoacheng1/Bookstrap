package com.bookstrap.model.bean;




import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	private Employees employeeFrom;
	
	@OneToOne
	@JoinColumn(name = "mail_to")
	private Employees employeeTo;
	
	@Temporal(TemporalType.TIMESTAMP) // sql.Date這個不用寫
	@Column(name = "mail_time")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date mailTime; //probably need more settings
	
	@Column(name = "mail_subject")
	private String mailSubject;
	
	@Column(name = "mail_content")
	private String mailContent;
	
	@Column(name = "starred")
	private Byte starred;
	
	@Column(name = "important")
	private Byte important;
	
	@Column(name = "hasread")
	private Byte hasread;

	@PrePersist //things to do before  into persistent state
	public void onCreate() {
		if (mailTime == null) {
			mailTime = new Date();
		}
	}
	//  ==========================RELATION COLUMNS==========================  // 
	@Column(name = "folder_id")
	@Transient
	private Integer folderId;
	
	@Column(name = "category_id")
	@Transient
	private Integer categoryId;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name = "category_id")
	private MailCategory mailCategory;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name="folder_id")
	private MailFolder mailFolder;
	
	@OneToMany(mappedBy = "mail")
	@JsonManagedReference
	private Set<MailAttachment> mailAttachment;
	
	@OneToMany(mappedBy = "mail")
	@JsonBackReference
	private Set<MailLabel> mailLabels;
	
	
	public Mail() {
	}
//===================GETTERS AND SETTERS =====================//

	public Integer getMailId() {
		return mailId;
	}

	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}

	public Employees getEmployeeFrom() {
		return employeeFrom;
	}

	public void setEmployeeFrom(Employees employeeFrom) {
		this.employeeFrom = employeeFrom;
	}

	public Employees getEmployeeTo() {
		return employeeTo;
	}

	public void setEmployeeTo(Employees employeeTo) {
		this.employeeTo = employeeTo;
	}

	public Date getMailTime() {
		return mailTime;
	}

	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public Byte getStarred() {
		return starred;
	}

	public void setStarred(Byte starred) {
		this.starred = starred;
	}

	public Byte getImportant() {
		return important;
	}

	public void setImportant(Byte important) {
		this.important = important;
	}

	public Byte getHasread() {
		return hasread;
	}

	public void setHasread(Byte hasread) {
		this.hasread = hasread;
	}

	public Integer getFolderId() {
		return folderId;
	}

	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public MailCategory getMailCategory() {
		return mailCategory;
	}

	public void setMailCategory(MailCategory mailCategory) {
		this.mailCategory = mailCategory;
	}

	public MailFolder getMailFolder() {
		return mailFolder;
	}

	public void setMailFolder(MailFolder mailFolder) {
		this.mailFolder = mailFolder;
	}

	public Set<MailAttachment> getMailAttachment() {
		return mailAttachment;
	}

	public void setMailAttachment(Set<MailAttachment> mailAttachment) {
		this.mailAttachment = mailAttachment;
	}

	public Set<MailLabel> getMailLabels() {
		return mailLabels;
	}

	public void setMailLabels(Set<MailLabel> mailLabels) {
		this.mailLabels = mailLabels;
	}
	
}
