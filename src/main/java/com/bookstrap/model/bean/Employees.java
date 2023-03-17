

package com.bookstrap.model.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Employees")
public class Employees {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="emp_id")
	private Integer empId;
	
	@Lob
	@Column(name = "emp_photo")
	private byte[] empPhoto;
	
	@Column(name="account")
	private String account;
	
	@Column(name="password")
	private String password;
	
	@Column(name="emp_name")
	private String empName;
	
	@Column(name="sex")
	private Short sex;
	
	@Column(name="emp_position")
	private String empPosition;
	
	@OneToOne(mappedBy="employee", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private ShopEmployees shopEmployee;


	public Employees() {
		
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Short getSex() {
		return sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public String getEmpPosition() {
		return empPosition;
	}

	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}

	public byte[] getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(byte[] empPhoto) {
		this.empPhoto = empPhoto;
	}

	public ShopEmployees getShopEmployee() {
		return shopEmployee;
	}

	public void setShopEmployee(ShopEmployees shopEmployee) {
		this.shopEmployee = shopEmployee;
	}
	
}
