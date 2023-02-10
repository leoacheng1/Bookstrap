package com.bookstrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.service.ShoppingCartsService;

@Controller
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;
	
	@GetMapping("shopping/cart")
	public String toShoppingCarts() {
		return "/shoppingcarts/shoppingcarts";
	}
	
	public ShoppingCarts showAllBooksByMemberId(Integer memberId) {
		return scService.findBooksByMemberId(memberId);
	}
}
