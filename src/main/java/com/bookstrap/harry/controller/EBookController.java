package com.bookstrap.harry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EBookController {

	
	@GetMapping("/ebook/index")
	public String toEBookIndex() {
		return "member/EBooks/EBookIndex";
	}
	

}
