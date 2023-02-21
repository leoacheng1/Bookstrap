package com.bookstrap.model.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.model.pk.MailLabelPK;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "MailLabel")
public class MailLabel {

	@EmbeddedId
	private MailLabelPK labelId;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "mail_id", insertable = false, updatable = false)
	private Mail mail;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name = "label_id", insertable = false, updatable = false)
	private AccountLabel label;
	
	public MailLabel() {
	}

}
