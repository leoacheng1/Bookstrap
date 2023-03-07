package com.bookstrap.harry.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bookstrap.model.Books;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "Comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Integer commentId;
	
	@Transient
	@Column(name = "member_id")
	private Integer memberId;
	
	@Transient
	@Column(name = "book_id")
	private Integer bookId;

	@Column(name = "content")
	private String content;

	@Column(name = "rating")
	private Integer evaluation;

	// ??最愛 0:沒有 1:有
	@Column(name = "favorite")
	private Integer favorite;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private	Members member;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)  //??
	@JoinColumn(name = "book_id")
	private Books book;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ebook_id")
	private EBooks eBook;
	
	
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Comment() {
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Integer evaluation) {
		this.evaluation = evaluation;
	}

	public Integer getFavorite() {
		return favorite;
	}

	public void setFavorite(Integer favorite) {
		this.favorite = favorite;
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

	public EBooks geteBook() {
		return eBook;
	}

	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}
	
	
}

