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

@Entity
@Table(name = "EBookFavorite")
public class EBookFavorite {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ebook_favorite_id")
	private Integer eBookFavoriteId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_ebook_id")
	private EBooks eBook;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_member_id")
	private Members member;
	
	
	public EBookFavorite() {
	}


	public Integer geteBookFavoriteId() {
		return eBookFavoriteId;
	}


	public void seteBookFavoriteId(Integer eBookFavoriteId) {
		this.eBookFavoriteId = eBookFavoriteId;
	}


	public EBooks geteBook() {
		return eBook;
	}


	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}


	public Members getMember() {
		return member;
	}


	public void setMember(Members member) {
		this.member = member;
	}

	
	
}
