package com.bookstrap.harry.config;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoogleController {

	@GetMapping("/google/get")
	public String getGoogleAccount(HttpSession session, @RequestParam("mName") String mName) {
			session.setAttribute("member", mName);
		return "redirect:/member/signin";
		
		
	}
	
}
