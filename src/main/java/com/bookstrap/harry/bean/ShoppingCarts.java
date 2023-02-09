package com.bookstrap.harry.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.model.Books;

@Entity
@Table(name = "ShoppingCart")
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private Members member;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id")
	private Books book;

	public ShoppingCarts() {
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

	public Books getBook() {
		return book;
	}

	public void setBook(Books book) {
		this.book = book;
	}

}
