package com.bookstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestIndex {

	@GetMapping("/index")
	public String toIndex() {
		
		return "index/index";
		
	}
	
}
