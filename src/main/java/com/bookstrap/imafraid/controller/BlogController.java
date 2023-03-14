package com.bookstrap.imafraid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	@GetMapping("/blog/blogIndex")
	public String goToIndex() {
		return "/blog/blogIndex";
	}
	@GetMapping("/blog/backIndex")
	public String goToBackIndex() {
		return "/blog/backIndex";
	}
	@GetMapping("/blog/createPara")
	public String goToCreate() {
		return "/blog/createPara";
	}
	@GetMapping("/blog/updatePara")
	public String goToupdate() {
		return "/blog/updatePara";
	}
	@GetMapping("/blog/testPage")
	public String goToTestPage() {
		return "/blog/testPage";
	}
	@GetMapping("/blog/showPage")
	public String goToShowPage() {
		return "/blog/showPage";
	}
}
