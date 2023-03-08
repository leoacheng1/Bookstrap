package com.bookstrap.harry.security;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookstrap.harry.bean.Members;

@Entity
@Table(name = "MemberRoles")
public class MemberRoles {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_role_id")
	private Integer memberRoleId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FK_member_id", nullable = false)
	private Members member;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FK_role_id", nullable = false)
	private Roles role;
	
	public MemberRoles() {
	}

	public Integer getMemberRoleId() {
		return memberRoleId;
	}

	public void setMemberRoleId(Integer memberRoleId) {
		this.memberRoleId = memberRoleId;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	

	
}
