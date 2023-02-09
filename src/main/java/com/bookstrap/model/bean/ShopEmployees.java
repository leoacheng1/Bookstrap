package com.bookstrap.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.model.Shops;
import com.bookstrap.model.pk.ShopEmployeesPK;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="ShopEmployees")
@IdClass(ShopEmployeesPK.class)
public class ShopEmployees {
	@Id
	@Column(name="emp_id")
	private Integer empId;
	
	@Id
	@Column(name="shop_id")
	private Integer shopId;

	@Column(name="salary")
	private Integer salary;
	
	@Column(name="title")
	private String title;
	
	@JsonBackReference
	@JoinColumn(name="emp_id", insertable=false, updatable=false)
	@ManyToOne
	private Employees employee;
	
	@JsonBackReference
	@JoinColumn(name="shop_id", insertable=false, updatable=false)
	@ManyToOne
	private Shops shop;

	public ShopEmployees() {
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Employees getEmployee() {
		return employee;
	}

	public void setEmployee(Employees employee) {
		this.employee = employee;
	}

	public Shops getShop() {
		return shop;
	}

	public void setShop(Shops shop) {
		this.shop = shop;
	}
	

}
