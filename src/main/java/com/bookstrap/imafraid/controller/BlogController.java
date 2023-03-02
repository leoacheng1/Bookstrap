package com.bookstrap.imafraid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	@GetMapping("/blog/blogIndex")
	public String goToIndex() {
		return "/blog/blogIndex";
	}
	@GetMapping("/blog/fakeIndex")
	public String goToFakeIndex() {
		return "/blog/fakeIndex";
	}
	@GetMapping("/blog/createPara")
	public String goToCreate() {
		return "/blog/createPara";
	}
	
	
}
