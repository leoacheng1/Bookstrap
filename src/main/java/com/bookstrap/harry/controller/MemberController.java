package com.bookstrap.harry.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
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
//	@PostMapping("/member/post")
//	public String memberSignUp(@RequestParam("memberName") String memberName, 
//			@RequestParam("memberEmail") String memberAccount, 
//			@RequestParam("memberEmail") String memberEmail, 
//			@RequestParam("memberPassword") String memberPassword, 
//			@RequestParam("membervalid") Integer memberValid,
//			@RequestParam("memberLevel") Integer memberLevel,
//			@RequestParam("memberSex") Integer memberSex,
//			@RequestParam("memberBirthday") Date memberBirthday,
//			@RequestParam("memberPhone") String memberPhone, 
//			@RequestParam("memberPhone") String memberCellPhone,
//			@RequestParam("memberAddress") String memberAddress) {
//		Members member = new Members();
//		MemberDetails memberDetail = new MemberDetails();
//		memberDetail.setMemberName(memberName);
//		member.setMemberAccount(memberAccount);
//		memberDetail.setMemberEmail(memberEmail);
//		member.setMemberPassword(memberPassword);
//		member.setMemberValid(memberValid);
//		member.setMemberLevel(memberLevel);
//		memberDetail.setMemberSex(memberSex);
//		memberDetail.setMemberBirthday(memberBirthday);
//		memberDetail.setMemberPhone(memberPhone);
//		memberDetail.setMemberAddress(memberAddress);
//							
//	return null;
//	}
	
	
	//在jsp裡接到Spring form表單裡 modelAttribute="" 接到的資料
	@PostMapping("/member/post")
	public String insertMember(@ModelAttribute Members member, 
			@ModelAttribute MemberDetails memberDetail, Model m) {
				memberService.insertMember(member);
				memberDetailService.insertMemberDetails(memberDetail);
				Members member2 = new Members();
				MemberDetails memberDetail = new MemberDetails();
				m.addAttribute("member", member2);
				m.addAttribute("memberDetail", memberDetail);
				
				return null;
	}
	
}