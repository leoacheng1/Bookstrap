package com.bookstrap.imafraid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.service.BlogParaService;

@Controller
public class BlogController {

	@Autowired
	private BlogParaService bpService;
	
	@ModelAttribute("newest")
	public BlogParagraph getNewest() {
		BlogParagraph newest = bpService.findLatestParaByIdNativeQuery();	
		return newest;
	}
	
	@GetMapping("/blog/blogIndex")
	public String blogindex(@RequestParam(value = "category", required = false) String category,Model m) {
		if (category == null) category = "全部";
		switch(category) {
			case "新書推薦":
				List<BlogParagraph> newBooks = bpService.findCatagory1NativeQuery();
				m.addAttribute("Books",newBooks);
				break;
			case "好書指南":
				List<BlogParagraph> goodBooks = bpService.findCatagory2NativeQuery(); //不同的dao
				m.addAttribute("Books",goodBooks);
				break;
//			case "null":
//				List<BlogParagraph> noBooks = bpService.findAllNativeQuery(); //不同的dao
//				m.addAttribute("Books",noBooks);
//				break;
				// ..............................//
			default:
				//找全部
				List<BlogParagraph> allBooks = bpService.findAllNativeQuery(); //不同的dao
				System.out.println("size: " + allBooks.size());
				m.addAttribute("Books",allBooks);
				break;
		}
		
		
//		m.addAttribute("category",category);
//		List<BlogParagraph> newBooks = bpService.findCatagory1NativeQuery();
//		m.addAttribute("newBooks",newBooks);
//		
//		List<BlogParagraph> hotBooks = bpService.findCatagory1NativeQuery();
//		m.addAttribute("hotBooks",hotBooks);
		
		
		
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
	@GetMapping("/blog/article/{pId}")
	public String goToArticle(@PathVariable("pId") Integer pId, Model m) {
		BlogParagraph p = bpService.findById(pId);
		m.addAttribute("article",p);
		return "/blog/article";
	}
	
	@GetMapping("/blog/article/2023/03/{pId}")
	public String goToArticleSortByMonth(@PathVariable("pId") Integer pId, Model m) {
		BlogParagraph p = bpService.findById(pId);
		m.addAttribute("article",p);
		return "/blog/article";
	}
}
