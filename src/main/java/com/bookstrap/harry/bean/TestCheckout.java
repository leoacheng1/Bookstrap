package com.bookstrap.harry.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TestCheckout")
public class TestCheckout {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_c_id")
	private Integer tcId;
	
	@JoinColumn(name = "FK_ts_id")
	@OneToOne(cascade = CascadeType.ALL)
	private TestShoppingCatrs tsc;
	
	public TestCheckout() {
	}

	public Integer getTcId() {
		return tcId;
	}

	public void setTcId(Integer tcId) {
		this.tcId = tcId;
	}

	public TestShoppingCatrs getTsc() {
		return tsc;
	}

	public void setTsc(TestShoppingCatrs tsc) {
		this.tsc = tsc;
	}

	
	
	
}
