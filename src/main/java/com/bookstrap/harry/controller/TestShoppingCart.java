package com.bookstrap.harry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestShoppingCart {

	@GetMapping("/member/test/shopptingcart")
	public String toShoppingCarts() {
		
		return "member/Main/MyCart";
	}
	
}
