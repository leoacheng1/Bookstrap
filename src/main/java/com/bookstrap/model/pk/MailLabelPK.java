package com.bookstrap.model.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class MailLabelPK implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "label_id")
	private Integer labelId;
	
	@Column(name = "mail_id")
	private Integer mailId;
	
	public MailLabelPK() {
	}

	public MailLabelPK(Integer labelId, Integer mailId) {
		this.labelId = labelId;
		this.mailId = mailId;
	}

	public Integer getLabelId() {
		return labelId;
	}

	public Integer getMailId() {
		return mailId;
	}

	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}

	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}

}
