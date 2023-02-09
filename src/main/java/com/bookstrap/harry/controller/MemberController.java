package com.bookstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
}