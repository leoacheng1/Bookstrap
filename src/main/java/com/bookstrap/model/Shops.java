package com.bookstrap.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bookstrap.model.bean.ShopEmployees;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="Shops")
public class Shops {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="shop_id")
	private Integer id;
	
	@Column(name="shop_name")
	private String shopName;
	
	@Column(name="address")
	private String shopAddress;
	
	@Column(name="phone")
	private String shopPhone;
	
	@Column(name="open_hour")
	private String shopOpenHour;
	
	@Column(name="close_hour")
	private String shopcloseHour;
	
	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shop")
	private List<ShopEmployees> shopEmployees;
	
	public String getShopcloseHour() {
		return shopcloseHour;
	}

	public void setShopcloseHour(String shopcloseHour) {
		this.shopcloseHour = shopcloseHour;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopPhone() {
		return shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getShopOpenHour() {
		return shopOpenHour;
	}

	public void setShopOpenHour(String shopOpenHour) {
		this.shopOpenHour = shopOpenHour;
	}

	public List<ShopEmployees> getShopEmployees() {
		return shopEmployees;
	}

	public void setShopEmployees(List<ShopEmployees> shopEmployees) {
		this.shopEmployees = shopEmployees;
	}

	public Shops() {
	}

}
