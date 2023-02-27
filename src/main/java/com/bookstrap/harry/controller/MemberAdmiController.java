
package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberAdmiController {

	@Autowired
	private MemberService memberService; 
	
	@Autowired
	private MemberDdetailService memberDetailService;
	

	@GetMapping("/admin/main")
	public String toAdmiMember() {
		return "member/Admi/MemberAdmiMain";
	}
	
	//member/admin/allmember?p=
	//在此addAttribut的page名為page，在jsp中用foreach來使用
	//顯示內容 <jstl:forEach var="messages" items="${page.content}">
	//顯示頁數 <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
	@GetMapping("/admin/get/allmember")
	public String getAllmembers(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			Model m) {
		Page<MemberDetails> page = memberDetailService.getMemberByPage(pageNumber);
		m.addAttribute("page", page);
		
		
		return "member/Admi/AdminAllMember";
	}
	
	@GetMapping("/admin/post/memberpage")
	public String addMemberPage(Model m) {
		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();
		
		m.addAttribute("member", member);
		m.addAttribute("memberDetail", memberDetail);
		
		return "member/Admi/AdminAddMember";
	}
	
	
	@PostMapping("/admin/post/member")
	public String addMember(@ModelAttribute("member") Members member,
			@ModelAttribute("memberDetail") MemberDetails memberDetails,
			BindingResult br) {
		if(br.hasErrors()) {
			return "member/Admi/AdminAddMember";
		}
		
		
		
		return null;
	}
	
//	@ModelAttribute("member")
//	public void commonData(Model m){
//		Members member = new Members();
//		
//		m.addAttribute("member", member);
//	}
//	
//	@ModelAttribute("memberdetail")
//	public void commonData2(Model m){
//		MemberDetails memberDetail = new MemberDetails();
//		
//		m.addAttribute("memberDetail", memberDetail);
//	}
	
}

