package com.bookstrap.model;


import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.bookstrap.harry.bean.Comment;
import com.bookstrap.harry.bean.Favorite;
import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.bean.ShopStock;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@Entity
@Table(name = "Books")
public class Books {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="book_id" )
	private Integer id;
	
	@Column(name ="book_name" )
	private String name;
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "languages")
	private String languages;
	
	@Column(name = "author")
	private String author;
	
	@Column(name = "publisher")
	private String publisher;
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	@Column(name = "publish_date")
	private Date date;
	
	@Lob
	@Column(name = "book_photo")
	private byte[] photo;
	
	@Column(name = "discount")
	private Integer discount;
	
	@Column(name = "price")
	private Integer price;
	
	@Column(name = "translator")
	private String translator;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JsonManagedReference
	@JoinColumn(name = "bookDetail_id")
	private BookDetails bookDetails;
	
	@JsonManagedReference	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book", cascade = CascadeType.ALL)
	private List<Comment> comment;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book", cascade = CascadeType.ALL)
	private Set<ShoppingCarts> shoppingCarts;
	
	@JsonManagedReference
	@OneToMany(mappedBy="book", cascade = CascadeType.ALL)
	private Set<ShopStock> shopStocks;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book", cascade = CascadeType.ALL)
	private Set<Favorite> favorite;
	
	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public Books() {
	}
	
	

	public Set<ShoppingCarts> getShoppingCarts() {
		return shoppingCarts;
	}

	public void setShoppingCarts(Set<ShoppingCarts> shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}

	
	
	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public BookDetails getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(BookDetails bookDetails) {
		this.bookDetails = bookDetails;
	}

	public Set<ShopStock> getShopStocks() {
		return shopStocks;
	}

	public void setShopStocks(Set<ShopStock> shopStocks) {
		this.shopStocks = shopStocks;
	}

}
