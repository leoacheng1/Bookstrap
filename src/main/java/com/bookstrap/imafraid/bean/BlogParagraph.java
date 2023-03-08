package com.bookstrap.imafraid.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "BlogParagraph")
public class BlogParagraph {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "paragraph_id")
	private Integer paragraphId;
	@Column(name = "paragraph_title")
	private String paragraphTitle;
	@Column(name = "paragraphContent")
	private String paragraphContent;
	@Column(name = "paragraphAuther")
	private String paragraphAuther;
	@Column(name = "paragraphCatagory")
	private String paragraphCatagory;
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "blogparagraph", cascade = CascadeType.ALL)
	private List<BlogPhotos> blogPhotos = new ArrayList<>();
	@Column(name = "isThisParaShow")
	private Integer isThisParaShow;
	
	
	public Integer getParagraphId() {
		return paragraphId;
	}

	public void setParagraphId(Integer paragraphId) {
		this.paragraphId = paragraphId;
	}

	public String getParagraphTitle() {
		return paragraphTitle;
	}

	public void setParagraphTitle(String paragraphTitle) {
		this.paragraphTitle = paragraphTitle;
	}


	public String getParagraphContent() {
		return paragraphContent;
	}

	public void setParagraphContent(String paragraphContent) {
		this.paragraphContent = paragraphContent;
	}

	public String getParagraphAuther() {
		return paragraphAuther;
	}

	public void setParagraphAuther(String paragraphAuther) {
		this.paragraphAuther = paragraphAuther;
	}

	public String getParagraphCatagory() {
		return paragraphCatagory;
	}

	public void setParagraphCatagory(String paragraphCatagory) {
		this.paragraphCatagory = paragraphCatagory;
	}

	public List<BlogPhotos> getBlogPhotos() {
		return blogPhotos;
	}

	public void setBlogPhotos(List<BlogPhotos> blogPhotos) {
		this.blogPhotos = blogPhotos;
	}

	public Integer getIsThisParaShow() {
		return isThisParaShow;
	}

	public void setIsThisParaShow(Integer isThisParaShow) {
		this.isThisParaShow = isThisParaShow;
	}



}
