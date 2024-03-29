package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.model.Books;
//import com.bookstrap.model.Books;
import com.bookstrap.model.Shops;
import com.bookstrap.model.pk.ShopStockPK;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="ShopStock")
@IdClass(ShopStockPK.class)
public class ShopStock {
	
	@Id
	@Column(name="shop_id")
	private Integer shopId;
	
	@Id
	@Column(name="book_id")
	private Integer bookId;
	
	@Column(name="amount")
	private Integer Amount;
	
	@JsonBackReference(value = "book-shopSotcks")
	@JoinColumn(name="book_id", insertable=false, updatable=false)
	@ManyToOne
	private Books book; 
	
	@JsonBackReference(value = "shop-shopStocks")
	@JoinColumn(name="shop_id", insertable=false, updatable=false)
	@ManyToOne
	private Shops shop;
	
	public ShopStock() {
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Integer getAmount() {
		return Amount;
	}

	public void setAmount(Integer amount) {
		Amount = amount;
	}

	public Books getBook() {
		return book;
	}

	public void setBook(Books book) {
		this.book = book;
	}

	public Shops getShop() {
		return shop;
	}

	public void setShop(Shops shop) {
		this.shop = shop;
	}

	
}
