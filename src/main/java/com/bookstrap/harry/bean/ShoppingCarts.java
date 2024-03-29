package com.bookstrap.harry.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.model.Books;
import com.bookstrap.model.pk.ShoppingCartsPK;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "ShoppingCarts")
@IdClass(ShoppingCartsPK.class)
public class ShoppingCarts implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "member_id")
	private Integer memberId;
	
	@Id
	@Column(name = "book_id")
	private Integer bookId;

	@Column(name = "amount")
	private Integer amount;

	@JsonBackReference(value = "member-shoppingCarts")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id", insertable=false, updatable=false)
	private Members member;

	@JsonBackReference(value = "book-shoppingCarts")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", insertable=false, updatable=false)
	private Books book;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ebook_id", insertable=false, updatable=false)
	private EBooks eBook;
	
	

	public ShoppingCarts() {
	}

	
	
	public Books getBook() {
		return book;
	}



	public void setBook(Books book) {
		this.book = book;
	}



	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	public EBooks geteBook() {
		return eBook;
	}

	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}

	

}
