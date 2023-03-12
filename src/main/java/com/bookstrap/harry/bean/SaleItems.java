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
import javax.persistence.Transient;

import com.bookstrap.model.Books;

@Entity
@Table(name = "SaleItems")
public class SaleItems {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_id")
	private Integer id;
	
	@Transient
	@Column(name = "sale_id")
	private Integer saleId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sale_id")
	private Sales sale;
	
	@Transient
	@Column(name = "book_id")
	private Integer bookId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id")
	private Books book;
	
	@Column(name = "amount")
	private Integer amount;
}
