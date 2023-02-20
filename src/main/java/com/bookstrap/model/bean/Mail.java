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
@Table(name="Mail")
public class Mail {
	
	@Id
	@Column(name = "mail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mailId;

	@Column(name = "folder_id")
	@Transient
	private Integer folderId;
	
	@Column(name = "category_id")
	@Transient
	private Integer categoryId;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private MailCategory mailCategory;
	
	@ManyToOne
	@JoinColumn(name="folder_id")
	private MailFolder mailFolder;
	
	public Mail() {
	}

}
