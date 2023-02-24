package com.bookstrap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.service.ShoppingCartsService;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;
	

	@GetMapping("/cart")
	public String checkSignIn(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "/shoppingcarts/shoppingcarts";
		}
		return "member/SignInPage";
	}
	
	@ResponseBody
	@GetMapping("/carts")
	public String findAllCarts(HttpSession session, Integer memberId, Model model) {
		List<ShoppingCarts> carts = scService.findCartsByMemberId(memberId);
		model.addAttribute("carts", carts);
		return "shoppingcarts/shoppingcarts";
	}
}
