package com.bookstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingCartController {

	@GetMapping("/shoppingcart/")
	public String getAllBooksByMemberId() {
		return null;
	}
}
