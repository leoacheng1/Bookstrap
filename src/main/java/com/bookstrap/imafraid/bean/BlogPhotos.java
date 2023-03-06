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

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "BlogPhotos")
public class BlogPhotos {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blogPhoto_id")
	private Integer blogPhotoId;
	
	@Column(name = "blogPhoto_name")
	private String blogPhotoName;
	
	@Column(name = "blogPhoto")
	private byte[] blogPhoto;

	@Column(name="fk_paragraph_id")
	@Transient
	private Integer paragraphId;
	@JsonBackReference
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

	public byte[] getBlogPhoto() {
		return blogPhoto;
	}
	public void setBlogPhoto(byte[] blogPhoto) {
		this.blogPhoto = blogPhoto;
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
