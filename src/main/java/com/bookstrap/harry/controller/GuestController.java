package com.bookstrap.harry.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class GuestController {

	
	
	
	@GetMapping("/guest/signin")
	public String memberSignIn(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "redirect:/member/main";
		}
		return "member/SignInPage";
	}

	@GetMapping("/guest/signup")
	public String memberSignUp() {

		return "member/SignUpPage";
	}

	@GetMapping("/guest/signinerror")
	public String memberSigninError() {

		return "member/TestFail";
	}
	
	
}
