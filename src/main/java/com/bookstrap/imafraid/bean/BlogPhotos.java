package com.bookstrap.imafraid.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "BlogPhotos")
public class BlogPhotos {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blogPhoto_id")
	private Integer blogPhotoId;
	@Column(name = "blogPhoto_name")
	private String blogPhotoName;
	@Column(name = "blogPhoto01")
	private byte blogPhoto01;
	@Column(name = "blogPhoto02")
	private byte blogPhoto02;
	@Column(name = "blogPhoto03")
	private byte blogPhoto03;
	@Column(name="fk_paragraph_id")
	@Transient
	private Integer paragraphId;
	@ManyToOne(fetch=FetchType.EAGER)
	private BlogParagraph blogparagraph;
	public Integer getBlogPhotoId() {
		return blogPhotoId;
	}
	public void setBlogPhotoId(Integer blogPhotoId) {
		this.blogPhotoId = blogPhotoId;
	}
	public String getBlogPhotoName() {
		return blogPhotoName;
	}
	public void setBlogPhotoName(String blogPhotoName) {
		this.blogPhotoName = blogPhotoName;
	}
	public byte getBlogPhoto01() {
		return blogPhoto01;
	}
	public void setBlogPhoto01(byte blogPhoto01) {
		this.blogPhoto01 = blogPhoto01;
	}
	public byte getBlogPhoto02() {
		return blogPhoto02;
	}
	public void setBlogPhoto02(byte blogPhoto02) {
		this.blogPhoto02 = blogPhoto02;
	}
	public byte getBlogPhoto03() {
		return blogPhoto03;
	}
	public void setBlogPhoto03(byte blogPhoto03) {
		this.blogPhoto03 = blogPhoto03;
	}
	public Integer getParagraphId() {
		return paragraphId;
	}
	public void setParagraphId(Integer paragraphId) {
		this.paragraphId = paragraphId;
	}
	public BlogParagraph getBlogparagraph() {
		return blogparagraph;
	}
	public void setBlogparagraph(BlogParagraph blogparagraph) {
		this.blogparagraph = blogparagraph;
	}
}
