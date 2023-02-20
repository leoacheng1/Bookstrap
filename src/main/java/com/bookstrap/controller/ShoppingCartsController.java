package com.bookstrap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.pk.ShoppingCartsPK;
import com.bookstrap.service.ShoppingCartsService;

@Controller
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;

	@GetMapping("/shopping/cart")
	public String checkSignIn(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "shoppingcarts/shoppingcarts";
		}
		return "member/SignInPage";
	}

	@ResponseBody
	@GetMapping("/shopping/carts")
	public ShoppingCarts getAllOrdersByMemberId(@SessionAttribute("memberId") ShoppingCartsPK memberId) {

		return scService.findOrdersByMemberId(memberId);

	}
}
