package com.bookstrap.harry.bean;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.bookstrap.model.BookDetails;
import com.bookstrap.model.bean.ShopStock;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "EBooks")
public class EBooks {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ebook_id" )
	private Integer eBookId;
	
	@Column(name ="ebook_name" )
	private String eBookName;
	
	@Column(name = "category")
	private String eBookCategory;
	
	@Column(name = "languages")
	private String eBookLanguages;
	
	@Column(name = "author")
	private String eBookAuthor;
	
	@Column(name = "publisher")
	private String eBookPublisher;
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	@Column(name = "publish_date")
	private Date eBookPublishDate;
	
	@Lob
	@Column(name = "ebook_photo")
	private byte[] eBookPhoto;
	
	@Column(name = "discount")
	private Integer eBookDiscount;
	
	@Column(name = "price")
	private Integer eBookPrice;
	
	@Column(name = "translator")
	private String eBookTranslator;

	@Lob
	@Column(name = "ebook_file")
	private byte[] eBookFile; 
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ebookDetail_id")
	private EBookDetails eBookDetails;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "eBook", cascade = CascadeType.ALL)
	private List<Comment> comment;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "eBook", cascade = CascadeType.ALL)
	private Set<ShoppingCarts> shoppingCarts;
	
	//For test
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private Members member;
	
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book", cascade = CascadeType.ALL)
//	private List<Favorite> favorite;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "eBook", cascade = CascadeType.ALL)
	private Set<EBookFavorite> eBookfavorite;
	
	public EBooks() {
	}

	
	


	

	public Set<EBookFavorite> geteBookfavorite() {
		return eBookfavorite;
	}



	public void seteBookfavorite(Set<EBookFavorite> eBookfavorite) {
		this.eBookfavorite = eBookfavorite;
	}



	public Integer geteBookId() {
		return eBookId;
	}

	public void seteBookId(Integer eBookId) {
		this.eBookId = eBookId;
	}

	public String geteBookName() {
		return eBookName;
	}

	public void seteBookName(String eBookName) {
		this.eBookName = eBookName;
	}

	public String geteBookCategory() {
		return eBookCategory;
	}

	public void seteBookCategory(String eBookCategory) {
		this.eBookCategory = eBookCategory;
	}

	public String geteBookLanguages() {
		return eBookLanguages;
	}

	public void seteBookLanguages(String eBookLanguages) {
		this.eBookLanguages = eBookLanguages;
	}

	public String geteBookAuthor() {
		return eBookAuthor;
	}

	public void seteBookAuthor(String eBookAuthor) {
		this.eBookAuthor = eBookAuthor;
	}

	public String geteBookPublisher() {
		return eBookPublisher;
	}

	public void seteBookPublisher(String eBookPublisher) {
		this.eBookPublisher = eBookPublisher;
	}

	public Date geteBookPublishDate() {
		return eBookPublishDate;
	}

	public void seteBookPublishDate(Date eBookPublishDate) {
		this.eBookPublishDate = eBookPublishDate;
	}

	public byte[] geteBookPhoto() {
		return eBookPhoto;
	}

	public void seteBookPhoto(byte[] eBookPhoto) {
		this.eBookPhoto = eBookPhoto;
	}

	public Integer geteBookDiscount() {
		return eBookDiscount;
	}

	public void seteBookDiscount(Integer eBookDiscount) {
		this.eBookDiscount = eBookDiscount;
	}

	public Integer geteBookPrice() {
		return eBookPrice;
	}

	public void seteBookPrice(Integer eBookPrice) {
		this.eBookPrice = eBookPrice;
	}

	public String geteBookTranslator() {
		return eBookTranslator;
	}

	public void seteBookTranslator(String eBookTranslator) {
		this.eBookTranslator = eBookTranslator;
	}

	public byte[] geteBookFile() {
		return eBookFile;
	}

	public void seteBookFile(byte[] eBookFile) {
		this.eBookFile = eBookFile;
	}

	public EBookDetails geteBookDetails() {
		return eBookDetails;
	}

	public void seteBookDetails(EBookDetails eBookDetails) {
		this.eBookDetails = eBookDetails;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public Set<ShoppingCarts> getShoppingCarts() {
		return shoppingCarts;
	}

	public void setShoppingCarts(Set<ShoppingCarts> shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	
	
	
	
	
}
