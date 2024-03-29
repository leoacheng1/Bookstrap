package com.bookstrap.model.bean;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bookstrap.model.Shops;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="ShopEmployees")
public class ShopEmployees{
	
	@Id
	@Column(name="emp_id")
	private Integer empId;
	
	@Column(name="emp_shopid")
	@Transient
	private Integer empShopid;
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name="emp_shopid")
	private Shops shop;
	
	@Column(name="emp_name")
	private String empName;

	@Lob
	@Column(name="emp_photo")
	private byte[] empPhoto;
	
	@Column(name="emp_salary")
	private Integer empSalary;
	
	@Column(name="emp_title")
	private String empTitle;
	
	@OneToOne
	@JsonManagedReference
	@JoinColumn(name="emp_id")
	@MapsId
	private Employees employee;
	
	@JsonManagedReference
	@OneToMany(mappedBy="attSemps", cascade = CascadeType.ALL)
	private List<ShopEmployeesAttendance> attendances;

	@JsonManagedReference
	@OneToMany(mappedBy="scheduleSemps", cascade = CascadeType.ALL)
	private Set<ShopEmployeesSchedule> schedules = new HashSet<>();

	public ShopEmployees() {
	}


	public Integer getEmpId() {
		return empId;
	}


	public void setEmpId(Integer empId) {
		this.empId = empId;
	}


	public Integer getEmpShopid() {
		return empShopid;
	}


	public void setEmpShopid(Integer empShopid) {
		this.empShopid = empShopid;
	}


	public Shops getShop() {
		return shop;
	}


	public void setShop(Shops shop) {
		this.shop = shop;
	}



	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public byte[] getEmpPhoto() {
		return empPhoto;
	}


	public void setEmpPhoto(byte[] empPhoto) {
		this.empPhoto = empPhoto;
	}


	public Integer getEmpSalary() {
		return empSalary;
	}


	public void setEmpSalary(Integer empSalary) {
		this.empSalary = empSalary;
	}


	public String getEmpTitle() {
		return empTitle;
	}


	public void setEmpTitle(String empTitle) {
		this.empTitle = empTitle;
	}


	public Employees getEmployee() {
		return employee;
	}


	public void setEmployee(Employees employee) {
		this.employee = employee;
	}


	public List<ShopEmployeesAttendance> getAttendances() {
		return attendances;
	}


	public void setAttendances(List<ShopEmployeesAttendance> attendances) {
		this.attendances = attendances;
	}


	public Set<ShopEmployeesSchedule> getSchedules() {
		return schedules;
	}


	public void setSchedules(Set<ShopEmployeesSchedule> schedules) {
		this.schedules = schedules;
	}



}