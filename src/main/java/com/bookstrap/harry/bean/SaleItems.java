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

import com.bookstrap.model.Books;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "SaleItems")
public class SaleItems {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_id")
	private Integer id;

	@Column(name = "sale_id")
	private Integer saleId;

	@JsonBackReference(value = "sales-saleItems")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sale_id", insertable=false, updatable=false)
	private Sales sale;

	@Column(name = "book_id")
	private Integer bookId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", insertable=false, updatable=false)
	private Books book;

	@Column(name = "ebook_id")
	private Integer ebookId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ebook_id", insertable=false, updatable=false)
	private EBooks ebook;

	@Column(name = "amount")
	private Integer amount;

	public SaleItems() {

	}
	public SaleItems(Integer bookId, Integer amount) {
	    this.bookId = bookId;
	    this.ebook = null;
	    this.amount = amount;
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
