package com.bookstrap.dto;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Lob;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;


public class BookUpdataDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("id")
	private Integer id;
	
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("author")
	private String author;
	
	@JsonProperty("publisher")
	private String publisher;
	
	@JsonProperty("category")
	private String category;
	
	@JsonProperty("languages")
	private String languages;
	
	@JsonProperty("date")
	private Date date;

	@JsonProperty("photo")
	private MultipartFile photo;
	
	@JsonProperty("discount")
	private Integer discount;
	
	@JsonProperty("price")
	private Integer price;
	
	@JsonProperty("translator")
	private String translator;
	
	@JsonProperty("size")
	private String size;
	
	@JsonProperty("pages")
	private Integer pages;
	
	@JsonProperty("intro")
	private String intro;
	
	@JsonProperty("grade")
	private String grade;
	
	public BookUpdataDto() {
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}



	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
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

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
