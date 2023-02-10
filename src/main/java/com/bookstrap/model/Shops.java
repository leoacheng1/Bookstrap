package com.bookstrap.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.model.bean.ShopStock;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Shops")
public class Shops {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "shop_id")
	private Integer id;

	@Column(name = "shop_name")
	private String shopName;

	@Column(name = "address")
	private String shopAddress;

	@Column(name = "phone")
	private String shopPhone;

	@Column(name = "open_hour")
	private String shopOpenHour;

	@Column(name = "close_hour")
	private String shopcloseHour;

	@Lob
	@Column(name = "shop_photo")
	private byte[] shopphoto;

	@Column(name = "longitude")
	private String longitude;

	@Column(name = "latitude")
	private String latitude;
	
	@JsonManagedReference
	@OneToMany(mappedBy="shop", cascade = CascadeType.ALL)
	private Set<ShopEmployees> shopEmployees = new LinkedHashSet<ShopEmployees>();

	@JsonManagedReference
	@OneToMany(mappedBy="shop", cascade = CascadeType.ALL)
	private Set<ShopStock> shopStocks = new LinkedHashSet<ShopStock>();
	
	
	public byte[] getShopphoto() {
		return shopphoto;
	}

	public void setShopphoto(byte[] shopphoto) {
		this.shopphoto = shopphoto;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

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

	public Shops() {
	}

	public Set<ShopEmployees> getShopEmployees() {
		return shopEmployees;
	}

	public void setShopEmployees(Set<ShopEmployees> shopEmployees) {
		this.shopEmployees = shopEmployees;
	}

}
