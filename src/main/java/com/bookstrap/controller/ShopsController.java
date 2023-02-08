package com.bookstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.service.ShopsService;

@Controller
public class ShopsController {

	private ShopsService shService;
	
	
	@GetMapping("/shops/insert")
	public String uploadPage() {
		return "shop/shopInsert";
	}
	
}
