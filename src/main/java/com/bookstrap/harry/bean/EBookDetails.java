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

}
