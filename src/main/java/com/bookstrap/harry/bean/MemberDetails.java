package com.bookstrap.harry.bean;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name = "MemberDetails")
public class MemberDetails {

	
@Id
@Column(name = "member_id" )
private Integer memberId;

@Column(name = "member_lastname")
private String memberLastName;

@Column(name = "member_firstname")
private String memberFirstName;

@Lob
@Column(name = "photo")
private byte[] memberPhoto;

@Column(name = "sex")
private Integer memberSex;

@Column(name = "email")
private String memberEmail;

@Column(name = "cellphone")
private String memberPhone;

@Column(name = "address")
private String memberAddress;

@Column(name = "birthday")
@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
private Date memberBirthday;


@JoinColumn(name = "member_id")
@OneToOne(cascade = CascadeType.ALL)
private Members member;

public MemberDetails() {
}




public MemberDetails(Integer memberId) {
	this.memberId = memberId;
}




public Members getMember() {
	return member;
}




public void setMember(Members member) {
	this.member = member;
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




public byte[] getMemberPhoto() {
	return memberPhoto;
}



public void setMemberPhoto(byte[] memberPhoto) {
	this.memberPhoto = memberPhoto;
}



public Integer getMemberSex() {
	return memberSex;
}



public void setMemberSex(Integer memberSex) {
	this.memberSex = memberSex;
}



public String getMemberEmail() {
	return memberEmail;
}



public void setMemberEmail(String memberEmail) {
	this.memberEmail = memberEmail;
}



public String getMemberPhone() {
	return memberPhone;
}



public void setMemberPhone(String memberPhone) {
	this.memberPhone = memberPhone;
}



public String getMemberAddress() {
	return memberAddress;
}



public void setMemberAddress(String memberAddress) {
	this.memberAddress = memberAddress;
}



public Date getMemberBirthday() {
	return memberBirthday;
}



public void setMemberBirthday(Date memberBirthday) {
	this.memberBirthday = memberBirthday;
}
	
	
	
	
}
