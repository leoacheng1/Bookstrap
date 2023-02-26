
package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberAdmiController {

	@Autowired
	private MemberService memberService; 
	
	@Autowired
	private MemberDdetailService memberDetailService;
	

	@GetMapping("member/admin/main")
	public String toAdmiMember() {
		return "member/Admi/MemberAdmiMain";
	}
	
	//member/admin/allmember?p=
	//在此addAttribut的page名為page，在jsp中用foreach來使用
	//顯示內容 <jstl:forEach var="messages" items="${page.content}">
	//顯示頁數 <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
	@GetMapping("member/admin/allmember")
	public String getAllmembers(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			Model m) {
		Page<MemberDetails> page = memberDetailService.getMemberByPage(pageNumber);
		m.addAttribute("page", page);
		
		
		return "member/Admi/AdminAllMember";
	}
	
	
}

