package com.bookstrap.harry.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;

@Controller
public class MemberController {

	@GetMapping("/member/signin")
	public String memberSignIn() {
		
		return "member/SignInPage";
	}
	
	@GetMapping("/member/signup")
	public String memberSignUp() {
		
		return "member/SignUpPage";
	}
	
	//Registration
	@GetMapping("/member/post")
	public String memberSignUp(@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberAccount, 
			@RequestParam("memberEmail") String memberEmail, 
			@RequestParam("memberPassword") String memberPassword, 
			@RequestParam("membervalid") Integer memberValid,
			@RequestParam("memberLevel") Integer memberLevel,
			@RequestParam("memberSex") String memberSex,
			@RequestParam("memberBirthday") Date memberBirthday,
			@RequestParam("memberPhone") String memberPhone, 
			@RequestParam("memberPhone") String memberCellPhone,
			@RequestParam("memberAddress") String memberAddress) {
		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();
		memberDetail.setMemberName(memberName);
		member.setMemberAccount(memberAccount);
		memberDetail.setMemberEmail(memberEmail);
		member.setMemberPassword(memberPassword);
		member.setMemberValid(memberValid);
		member.setMemberLevel(memberLevel);
		
		
		
	return null;
	}
	
	
}