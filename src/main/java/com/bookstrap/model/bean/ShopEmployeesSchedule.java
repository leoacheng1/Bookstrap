package com.bookstrap.model.bean;

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
@Table(name = "ShopEmployeesSchedule")
public class ShopEmployeesSchedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "schedule_id")
	private Integer scheduleId;
	
	@Column(name="schedule_empid")
	@Transient
	private Integer scheduleEmpid;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "schedule_empid")
	private ShopEmployees scheduleSemps;
	
	@Column(name = "schedule_startdate")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date scheduleStartdate;
	
	@Column(name = "schedule_enddate")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date scheduleEnddate;
	
	@Column(name="schedule_vacation")
	private String scheduleVacation;
	
	public ShopEmployeesSchedule() {
	}

	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Integer getScheduleEmpid() {
		return scheduleEmpid;
	}

	public void setScheduleEmpid(Integer scheduleEmpid) {
		this.scheduleEmpid = scheduleEmpid;
	}

	public ShopEmployees getScheduleSemps() {
		return scheduleSemps;
	}

	public void setScheduleSemps(ShopEmployees scheduleSemps) {
		this.scheduleSemps = scheduleSemps;
	}

	public Date getScheduleStartdate() {
		return scheduleStartdate;
	}

	public void setScheduleStartdate(Date scheduleStartdate) {
		this.scheduleStartdate = scheduleStartdate;
	}

	public Date getScheduleEnddate() {
		return scheduleEnddate;
	}

	public void setScheduleEnddate(Date scheduleEnddate) {
		this.scheduleEnddate = scheduleEnddate;
	}

	public String getScheduleVacation() {
		return scheduleVacation;
	}

	public void setScheduleVacation(String scheduleVacation) {
		this.scheduleVacation = scheduleVacation;
	}
	
}
