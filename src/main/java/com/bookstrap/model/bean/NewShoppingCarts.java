package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.harry.bean.Members;
import com.bookstrap.model.Books;
import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Data
@Entity
@Table(name = "NewShoppingCarts")
public class NewShoppingCarts {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cart_id")
	private Integer cartId;
	
	@Column(name = "member_id")
	private Integer memberId;
	
	@Column(name = "book_id")
	private Integer bookId;
	
	@JsonBackReference(value = "member-newShoppingCarts")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id", insertable=false, updatable=false)
	private Members member;

	@JsonBackReference(value = "book-newShoppingCarts")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", insertable=false, updatable=false)
	private Books book;
	
	@Column(name = "amount")
	private Integer amount;
	
	@Column(name = "price")
	private Integer price;

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	

}
