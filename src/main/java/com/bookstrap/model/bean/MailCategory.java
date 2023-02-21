package com.bookstrap.model.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="MailCategory")
public class MailCategory {
	@Id
	@Column(name = "category_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categoryId;
	
	@Column(name = "category_name")
	private String categoryName;
	
	
	@OneToMany(mappedBy = "mailCategory")
	@JsonBackReference
	private Set<Mail> mails;
	
	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public Set<Mail> getMails() {
		return mails;
	}


	public void setMails(Set<Mail> mails) {
		this.mails = mails;
	}


	public MailCategory() {
	}

}
