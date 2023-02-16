<<<<<<< HEAD
//package com.bookstrap.harry.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.bookstrap.harry.service.MemberDdetailService;
//import com.bookstrap.harry.service.MemberService;
//
//@Controller
//public class MemberAdmiController {
//
//	@Autowired
//	private MemberService memberService; 
//	
//	@Autowired
//	private MemberDdetailService memberDetailService;
//	
//	
//	@GetMapping("/memberadmi/main")
//	public String toAdmiMember() {
//		return "member/Admi/template";
//	}
//	
//}
=======
package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberAdmiController {

	@Autowired
	private MemberService memberService; 
	
	@Autowired
	private MemberDdetailService memberDetailService;
	
	
	@GetMapping("memberadmi/main")
	public String toAdmiMember() {
		return "member/Admi/MemberAdmiMain";
	}
	
}
>>>>>>> parent of bc81646 (Dashboard add)
