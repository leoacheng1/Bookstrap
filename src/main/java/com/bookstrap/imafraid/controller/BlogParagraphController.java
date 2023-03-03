package com.bookstrap.imafraid.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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

	@PostMapping("/blog/createParagraph")
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

	@PostMapping("/blog/getAllBlogParagraph")
	@ResponseBody
	public List<BlogParagraph> getAllBlogParagraph() {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();

		return allBlogParagraph;
	}

	@GetMapping("/blog/getAllBlogParagraphMVC")
	public String getAllBlogParagraphMVC(Model m) {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();

		m.addAttribute("paraList", allBlogParagraph);

		return "/blog/fakeIndex_mvc";
	}
	@DeleteMapping("/blog/deleteParaById")
	@ResponseBody
	public String deleteParaById(@RequestParam Integer id) {
		System.out.println(id);
		blogParaService.deleteParaById(id);
		return "delete success";
	}
	@PostMapping("/blog/updatePara")
	public String updatePara(@RequestParam Integer id,@RequestParam String pTitle, @RequestParam String pContent, @RequestParam String pAuther,
			@RequestParam String pCatagory) {
		blogParaService.updatePara(id,pTitle,pContent,pAuther,pCatagory);
		return "/blog/blogIndex";
		
	@ResponseBody
	public String GetP
		
		
		
		
	}
}
