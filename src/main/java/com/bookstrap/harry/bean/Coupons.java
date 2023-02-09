package com.bookstrap.harry.bean;

import java.util.List;

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
@Table(name = "Coupons")
public class Coupons {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "coupon_id")
	private Integer couponId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "discount")
	private Integer discount;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "coupon", cascade = CascadeType.ALL)
	private List<UserCoupon> usercoupon;
	
	public Coupons() {
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public List<UserCoupon> getUsercoupon() {
		return usercoupon;
	}

	public void setUsercoupon(List<UserCoupon> usercoupon) {
		this.usercoupon = usercoupon;
	}

}
