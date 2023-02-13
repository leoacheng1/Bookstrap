package com.bookstrap.harry.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="UserCoupon")
public class UserCoupon implements Serializable{


	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "coupon_id")
	private Integer couponId;
	
	@Id
	@Column(name = "member_id")
	private Integer memberId;
	
	@Column(name = "amount")
	private Integer amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private Members member;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "coupon_id")
	private Coupons coupon;
	
	public UserCoupon() {
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	public Coupons getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupons coupon) {
		this.coupon = coupon;
	}

}
