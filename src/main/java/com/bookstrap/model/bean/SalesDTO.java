package com.bookstrap.model.bean;

import java.util.Date;

import com.bookstrap.harry.bean.Sales;

public class SalesDTO {
    private Integer saleId;
    private String address;
    private String delivery;
    private Integer shop;
    private String shopName;
    private String payment;
    private Integer totalPrice;
    private String pay;
    private Integer weight;
    private String status;
    private Date orderTime;
    private Integer memberId;
    private String memberLastName;
    private String memberFirstName;
    
    public SalesDTO(Sales sale) {
        this.saleId = sale.getSaleId();
        this.address = sale.getAddress();
        this.delivery = sale.getDelivery();
        this.shop = sale.getShopId();
        this.payment = sale.getPayment();
        this.totalPrice = sale.getTotalPrice();
        this.pay = sale.getPay();
        this.weight = sale.getWeight();
        this.status = sale.getStatus();
        this.orderTime = sale.getOrderTime();
        this.memberId = sale.getMemberId();
        this.memberLastName = sale.getMember().getMemberDetails().getMemberLastName();
        this.memberFirstName = sale.getMember().getMemberDetails().getMemberFirstName();
        this.shopName = sale.getShop().getShopName();
    }

	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public Integer getShop() {
		return shop;
	}

	public void setShop(Integer shop) {
		this.shop = shop;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberLastName() {
		return memberLastName;
	}

	public void setMemberLastName(String memberLastName) {
		this.memberLastName = memberLastName;
	}

	public String getMemberFirstName() {
		return memberFirstName;
	}

	public void setMemberFirstName(String memberFirstName) {
		this.memberFirstName = memberFirstName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
    
}