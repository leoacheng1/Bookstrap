package com.bookstrap.harry.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EBookPurchases")
public class EBookPurchases {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ebook_purchase_id")
	private Integer eBookPurchaseId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_ebook_id")
	private EBooks eBook;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_member_id")
	private Members member;
	
	@Column(name = "purchase_status")
	private boolean purchaseStatus; 
	
			
	
	public EBookPurchases() {
	}



	public Integer geteBookPurchaseId() {
		return eBookPurchaseId;
	}



	public void seteBookPurchaseId(Integer eBookPurchaseId) {
		this.eBookPurchaseId = eBookPurchaseId;
	}



	public EBooks geteBook() {
		return eBook;
	}



	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}



	public Members getMember() {
		return member;
	}



	public void setMember(Members member) {
		this.member = member;
	}



	public boolean isPurchaseStatus() {
		return purchaseStatus;
	}



	public void setPurchaseStatus(boolean purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	
	
}
