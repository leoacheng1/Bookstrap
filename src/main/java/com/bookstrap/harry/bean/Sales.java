
package com.bookstrap.harry.bean;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "Sales")
public class Sales {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sale_id")
	private Integer saleId;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "delivery")
	private String delivery;
	
	@Column(name = "payment")
	private String payment;
	
	@Column(name = "total_price")
	private Integer totalPrice;
	
	@Column(name = "pay")
	private String pay;
	
	@Column(name = "weight")
	private Integer weight;

	@Column(name = "status")
	private String status;
	
	@Column(name = "order_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderTime;
			
	@Column(name = "member_id")
	private Integer memberId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id", insertable=false, updatable=false)
	private Members member;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sale", cascade = CascadeType.ALL)
	private List<SaleItems> saleItems;
	
	@PrePersist
	protected void onCreate() {
		this.orderTime = new Date();
	}
	
	public Sales() {
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public List<SaleItems> getSaleItems() {
		return saleItems;
	}

	public void setSaleItems(List<SaleItems> saleItems) {
		this.saleItems = saleItems;
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

	public String getDelievery() {
		return delivery;
	}

	public void setDelievery(String delievery) {
		this.delivery = delievery;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
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

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

}

