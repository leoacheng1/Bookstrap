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
	private String eBookcategory;
	
	@Column(name = "languages")
	private String eBooklanguages;
	
	@Column(name = "author")
	private String eBookauthor;
	
	@Column(name = "publisher")
	private String eBookpublisher;
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	@Column(name = "publish_date")
	private Date eBookPublishDate;
	
	@Lob
	@Column(name = "ebook_photo")
	private byte[] eBookphoto;
	
	@Column(name = "discount")
	private Integer eBookdiscount;
	
	@Column(name = "price")
	private Integer eBookprice;
	
	@Column(name = "translator")
	private String eBooktranslator;

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
	

	public EBooks() {
	}

	
	
	
	
	
}
