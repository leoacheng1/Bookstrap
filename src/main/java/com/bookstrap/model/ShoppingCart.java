package com.bookstrap.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.harry.bean.Members;

@Entity
@Table(name = "ShoppingCarts")
@IdClass(ShoppingCartPK.class)
public class ShoppingCart {

	@Id
	@Column(name = "member_id")
	private Integer memberId;

	@Id
	@Column(name = "book_id")
	private Integer bookId;

	@Column(name = "amount")
	private Integer amount;

	@JoinColumn(name = "member_id", insertable = false, updatable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Members member;

	@JoinColumn(name = "book_id", insertable = false, updatable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Books book;

	public ShoppingCart() {
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
