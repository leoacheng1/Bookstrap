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
	
	@Transient
	@Column(name = "ebook_id")
	private Integer ebookId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ebook_id")
	private EBooks ebook;
	
	@Column(name = "amount")
	private Integer amount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public Sales getSale() {
		return sale;
	}

	public void setSale(Sales sale) {
		this.sale = sale;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Books getBook() {
		return book;
	}

	public void setBook(Books book) {
		this.book = book;
	}

	public Integer getEbookId() {
		return ebookId;
	}

	public void setEbookId(Integer ebookId) {
		this.ebookId = ebookId;
	}

	public EBooks getEbook() {
		return ebook;
	}

	public void setEbook(EBooks ebook) {
		this.ebook = ebook;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	
}
