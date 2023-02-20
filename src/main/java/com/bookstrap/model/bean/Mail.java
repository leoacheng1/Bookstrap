package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Mail")
public class Mail {
	
	@Id
	@Column(name = "mail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mailId;

	
	
	
	public Mail() {
	}

}
