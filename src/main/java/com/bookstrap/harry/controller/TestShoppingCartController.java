package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.bean.TestShoppingCatrs;
import com.bookstrap.harry.service.TestShoppingCartService;

@Controller
public class TestShoppingCartController {

	@Autowired
	private TestShoppingCartService tscService;
	 
	@GetMapping("/test/ebook/add/shoppingcart")
	public String addTestShpoppingCart(@RequestParam("memberId") Members member, 
			@RequestParam("eBookId") EBooks eBook, Model m) {
		
		TestShoppingCatrs tsc = new TestShoppingCatrs();
		tsc.setMember(member);
		tsc.seteBook(eBook);
		TestShoppingCatrs t = tscService.insertTestShoppingCart(tsc);
		
		m.addAttribute("tsc", t);
		return "member/TestSuccess";
	}
	
}
