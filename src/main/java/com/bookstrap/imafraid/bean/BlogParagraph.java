package com.bookstrap.imafraid.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "BlogParagraph")
public class BlogParagraph {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "paragraph_id")
	private Integer paragraphId;
	@Column(name = "paragraph_title")
	private String paragraphTitle;
	@Column(name = "paragraphdiv01")
	private String paragraphdiv01;
	@Column(name = "paragraphdiv02")
	private String paragraphdiv02;
	@Column(name = "paragraphdiv03")
	private String paragraphdiv03;
	@Column(name = "paragraphAuther")
	private String paragraphAuther;
	@Column(name = "paragraphCatagory")
	private String paragraphCatagory;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="blogparagraph",cascade= CascadeType.ALL)
	private Set<BlogPhotos> blogPhotos = new HashSet<BlogPhotos>();
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
	public String getParagraphdiv01() {
		return paragraphdiv01;
	}
	public void setParagraphdiv01(String paragraphdiv01) {
		this.paragraphdiv01 = paragraphdiv01;
	}
	public String getParagraphdiv02() {
		return paragraphdiv02;
	}
	public void setParagraphdiv02(String paragraphdiv02) {
		this.paragraphdiv02 = paragraphdiv02;
	}
	public String getParagraphdiv03() {
		return paragraphdiv03;
	}
	public void setParagraphdiv03(String paragraphdiv03) {
		this.paragraphdiv03 = paragraphdiv03;
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
	public Set<BlogPhotos> getBlogPhotos() {
		return blogPhotos;
	}
	public void setBlogPhotos(Set<BlogPhotos> blogPhotos) {
		this.blogPhotos = blogPhotos;
	}

}
