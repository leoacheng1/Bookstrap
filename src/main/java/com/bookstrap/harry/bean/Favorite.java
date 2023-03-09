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

@Entity
@Table(name = "Favorite")
public class Favorite {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "favorite_id")
	private Integer favoriteId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_book_id")
	private Books book;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_member_id")
	private Members member;
	
	
	public Favorite() {
	}


	public Integer getFavoriteId() {
		return favoriteId;
	}


	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}


	public Books getBook() {
		return book;
	}


	public void setBook(Books book) {
		this.book = book;
	}


	public Members getMember() {
		return member;
	}


	public void setMember(Members member) {
		this.member = member;
	}

	
	
}
