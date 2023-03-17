package com.bookstrap.harry.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TestShoppingCarts")
public class TestShoppingCatrs {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_s_id")
	private Integer tsId;
	
	@JoinColumn(name = "FK_member_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Members member;
	
	@JoinColumn(name = "FK_eBook_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private EBooks eBook;
	
	@OneToOne(mappedBy = "tsc")
	private TestCheckout tc;
	
	public TestShoppingCatrs() {
	}

	public Integer getTsId() {
		return tsId;
	}

	public void setTsId(Integer tsId) {
		this.tsId = tsId;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	public EBooks geteBook() {
		return eBook;
	}

	public void seteBook(EBooks eBook) {
		this.eBook = eBook;
	}

	public TestCheckout getTc() {
		return tc;
	}

	public void setTc(TestCheckout tc) {
		this.tc = tc;
	}

	
	
	
	
	
	
}
