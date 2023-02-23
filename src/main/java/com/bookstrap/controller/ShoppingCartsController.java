package com.bookstrap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.service.ShoppingCartsService;

@Controller
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;
	

	@GetMapping("/shopping/cart")
	public String checkSignIn(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "/shoppingcarts/shoppingcarts";
		}
		return "member/SignInPage";
	}
	
	@ResponseBody
	@GetMapping("/shopping/carts")
	public List<ShoppingCarts> findAllCarts(HttpSession session, Integer memberId) {
		return scService.findCartsByMemberId(memberId);
	}
}
