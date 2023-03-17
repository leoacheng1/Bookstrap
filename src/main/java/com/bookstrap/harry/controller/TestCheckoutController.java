package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.TestCheckout;
import com.bookstrap.harry.bean.TestShoppingCatrs;
import com.bookstrap.harry.service.TestCheckoutSercvice;

@Controller
public class TestCheckoutController {

	@Autowired
	private TestCheckoutSercvice tcService;
	
	@GetMapping("/test/ebook/add/checkout")
	public String addCheckout(@RequestParam("tsc") TestShoppingCatrs tsc, Model m) {
		TestCheckout testCheckout = new TestCheckout();
		testCheckout.setTsc(tsc);
		
		TestCheckout nTc = tcService.insertTestCheckout(testCheckout);
		m.addAttribute("nTc", nTc);
		
		return "member/Test/CheckoutSuccess";
	}
	
}
