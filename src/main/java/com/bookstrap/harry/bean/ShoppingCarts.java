package com.bookstrap.harry.bean;

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
public class ShoppingCarts {

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

}
