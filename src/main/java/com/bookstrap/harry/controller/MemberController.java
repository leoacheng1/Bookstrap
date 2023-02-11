package com.bookstrap.harry.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDdetailService memberDetailService;

	@GetMapping("/member/signin")
	public String memberSignIn() {
		
		return "member/SignInPage";
	}
	
	@GetMapping("/member/signup")
	public String memberSignUp() {
		
		return "member/SignUpPage";
	}
	
	//Registration
	@PostMapping("/member/post")
	public String memberSignUp(@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberAccount, 
			@RequestParam("memberEmail") String memberEmail, 
			@RequestParam("memberPassword") String memberPassword,
			@RequestParam("re_memberPassword") String memberRePassword,
			@RequestParam("memberValid") Integer memberValid,
			@RequestParam("memberLevel") Integer memberLevel,
			@RequestParam("memberSex") Integer memberSex,
			@RequestParam("memberBirthday") Date memberBirthday,
			@RequestParam("memberPhone") String memberPhone, 
			@RequestParam("memberPhone") String memberCellPhone,
			@RequestParam("memberAddress") String memberAddress, Model m) {
		
			
			java.util.Date jDate = new java.util.Date();
			long time = jDate.getTime();
			Date sDate = new Date(time);
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(memberName == null || memberName.length() == 0) {
			errors.put("errName", "memberName is require!");
		}
		
		if(memberEmail == null || memberEmail.length() == 0 ) {
			errors.put("errEmail;", "Email is required!");
		}
		if(memberPassword == null || memberPassword.length() == 0 ) {
			errors.put("errPassword;", "Password is required!");
		}
		
		if(memberRePassword == null || memberRePassword.length() ==0 && memberRePassword != memberPassword) {
			errors.put("rePassword", "Checked password is wrong!");
					}
		
		if(memberSex == 0 ) {
			errors.put("errGender;", "Please choose your gender!");
		}
		
		
		if(memberBirthday == null || memberBirthday == sDate) {
			errors.put("errBirthday;", "Birthday form is wrong");
		}
		if(memberEmail == null || memberEmail.length() == 0 ) {
			errors.put("errEmail;", "Email is required!");
		}
		
		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();
		memberDetail.setMemberName(memberName);
		member.setMemberAccount(memberAccount);
		memberDetail.setMemberEmail(memberEmail);
		member.setMemberPassword(memberPassword);
		member.setMemberValid(memberValid);
		member.setMemberLevel(memberLevel);
		memberDetail.setMemberSex(memberSex);
		memberDetail.setMemberBirthday(memberBirthday);
		memberDetail.setMemberPhone(memberPhone);
		memberDetail.setMemberAddress(memberAddress);
		memberService.insertMember(member);
		Integer rMemberId = member.getMemberId();
		System.out.println("rId: " + rMemberId);
		memberDetail.setMemberId(rMemberId);
		memberDetailService.insertMemberDetails(memberDetail);
	return "member/TestSuccess";
	}

	

	
}