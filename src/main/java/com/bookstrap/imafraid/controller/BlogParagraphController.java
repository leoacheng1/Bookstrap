package com.bookstrap.imafraid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.service.BlogParaService;

@Controller
public class BlogParagraphController {

	@Autowired
	private BlogParaService blogParaService;

	@PostMapping("/createParagraph")
	public String createPara(@RequestParam String pTitle, @RequestParam String pContent, @RequestParam String pAuther,
			@RequestParam String pCatagory) {
		BlogParagraph bp = new BlogParagraph();
		bp.setParagraphTitle(pTitle);
		bp.setParagraphContent(pContent);
		bp.setParagraphAuther(pAuther);
		bp.setParagraphCatagory(pCatagory);

		blogParaService.insertBlog(bp);

		return "/blog/blogIndex";
	}

	@PostMapping("/getAllBlogParagraph")
	@ResponseBody
	public List<BlogParagraph> getAllBlogParagraph() {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();

		return allBlogParagraph;
	}

	@GetMapping("/getAllBlogParagraphMVC")
	public String getAllBlogParagraphMVC(Model m) {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();

		m.addAttribute("paraList", allBlogParagraph);

		return "/blog/fakeIndex_mvc";
	}

}
