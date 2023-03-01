package com.bookstrap.harry.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "EBookDetails")
public class EBookDetails {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ebook_detail_id" )
	private Integer eBookDetailId;
	
	@Column(name ="size" )
	private String eBooksize;
	
	@Column(name ="pages_amount" )
	private Integer eBookpages;
	
	@Column(name ="book_intro" )
	private String eBookintro;
	
	@Column(name ="grade" )
	private String eBookgrade;
	
	@OneToOne(mappedBy = "eBookDetails")
	private EBooks eBook;
	
	
	
	public EBookDetails() {
	}



	public Integer geteBookDetailId() {
		return eBookDetailId;
	}



	public void seteBookDetailId(Integer eBookDetailId) {
		this.eBookDetailId = eBookDetailId;
	}



	public String geteBooksize() {
		return eBooksize;
	}



	public void seteBooksize(String eBooksize) {
		this.eBooksize = eBooksize;
	}



	public Integer geteBookpages() {
		return eBookpages;
	}



	public void seteBookpages(Integer eBookpages) {
		this.eBookpages = eBookpages;
	}



	public String geteBookintro() {
		return eBookintro;
	}



	public void seteBookintro(String eBookintro) {
		this.eBookintro = eBookintro;
	}



	public String geteBookgrade() {
		return eBookgrade;
	}



	public void seteBookgrade(String eBookgrade) {
		this.eBookgrade = eBookgrade;
	}



	public EBooks geteBook() {
		return eBook;
	}



	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}

}
