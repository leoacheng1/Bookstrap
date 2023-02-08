package com.bookstrap.harry.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Members")
public class Members {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Integer memberId;
	
	@Column(name = "acccount")
	private String memberAccount;
	
	@Column(name = "password")
	private String memberPassword;
	
	@Column(name = "valid")
	private Integer memberValid;
	
	@Column(name = "member_level")
	private String memberLevel;

	//雙向，去找memberDetails有本類別屬性的參考變數
	@OneToOne(mappedBy ="member")
	private MemberDetails memberDetails;
	
	
	public MemberDetails getMemberDetails() {
		return memberDetails;
	}

	public void setMemberDetails(MemberDetails memberDetails) {
		this.memberDetails = memberDetails;
	}

	public Members() {
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public Integer getMemberValid() {
		return memberValid;
	}

	public void setMemberValid(Integer memberValid) {
		this.memberValid = memberValid;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	
	
	
	
	
	
	
	
}
