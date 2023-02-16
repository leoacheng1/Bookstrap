package com.bookstrap.imafraid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	@GetMapping("/blog/blogIndex")
	public String goToIndex() {
		return "/blog/blogIndex";
	}
}
