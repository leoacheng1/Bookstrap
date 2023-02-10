

package com.bookstrap.model.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="Employees")
public class Employees {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="emp_id")
	private Integer empId;
	
	@Column(name = "emp_photo")
	private byte[] empPhoto;
	
	@Column(name="account")
	private String account;
	
	@Column(name="password")
	private String password;
	
	@Column(name="emp_name")
	private String empName;
	
	@Column(name="sex")
	private byte sex;
	
	@Column(name="emp_position")
	private String empPosition;
	
	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "employee")
	private List<ShopEmployees> shopEmployees;

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

	public byte getSex() {
		return sex;
	}

	public void setSex(byte sex) {
		this.sex = sex;
	}

	public String getEmpPosition() {
		return empPosition;
	}

	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}

	public List<ShopEmployees> getShopEmployees() {
		return shopEmployees;
	}

	public void setShopEmployees(List<ShopEmployees> shopEmployees) {
		this.shopEmployees = shopEmployees;
	}	
}
