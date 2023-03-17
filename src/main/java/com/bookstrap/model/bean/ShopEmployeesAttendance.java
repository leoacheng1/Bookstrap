package com.bookstrap.model.bean;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "ShopEmployeesAttendance")
public class ShopEmployeesAttendance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "attend_id")
	private Integer attId;
	
	@Column(name="attend_empid")
	@Transient
	private Integer attSempid;

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "attend_empid")
	private ShopEmployees attSemps;

	@Column(name = "attend_startdate")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private LocalDate attStartDate;
	
	@Column(name = "attend_enddate")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private LocalDate attEndDate;

	@Column(name = "attend_vacation")
	private String attVacation;

	@Column(name = "attend_reason")
	private String attReason;
	
	@Column(name = "attend_time")
	private Integer attTime;

	@Column(name = "attend_agree")
	private String attAgree;


	public ShopEmployeesAttendance() {
	}


	public Integer getAttId() {
		return attId;
	}


	public void setAttId(Integer attId) {
		this.attId = attId;
	}


	public Integer getAttSempid() {
		return attSempid;
	}


	public void setAttSempid(Integer attSempid) {
		this.attSempid = attSempid;
	}


	public ShopEmployees getAttSemps() {
		return attSemps;
	}


	public void setAttSemps(ShopEmployees attSemps) {
		this.attSemps = attSemps;
	}


	public LocalDate getAttStartDate() {
		return attStartDate;
	}


	public void setAttStartDate(LocalDate attStartDate) {
		this.attStartDate = attStartDate;
	}


	public LocalDate getAttEndDate() {
		return attEndDate;
	}


	public void setAttEndDate(LocalDate attEndDate) {
		this.attEndDate = attEndDate;
	}


	public String getAttVacation() {
		return attVacation;
	}


	public void setAttVacation(String attVacation) {
		this.attVacation = attVacation;
	}


	public String getAttReason() {
		return attReason;
	}


	public void setAttReason(String attReason) {
		this.attReason = attReason;
	}


	public Integer getAttTime() {
		return attTime;
	}


	public void setAttTime(Integer attTime) {
		this.attTime = attTime;
	}


	public String getAttAgree() {
		return attAgree;
	}


	public void setAttAgree(String attAgree) {
		this.attAgree = attAgree;
	}

	

	


	
}
