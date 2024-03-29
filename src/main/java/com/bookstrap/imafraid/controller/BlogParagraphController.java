package com.bookstrap.imafraid.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.bean.BlogPhotos;
import com.bookstrap.imafraid.service.BlogParaService;

@Controller
public class BlogParagraphController {

	@Autowired
	private BlogParaService blogParaService;
	
//	@Autowired
//	private BlogParagraphRepository blogParaDao;
		
	@PostMapping("/blog/createParagraph")
	public String createPara(@RequestParam String pTitle, @RequestParam String pContent, @RequestParam String pAuther,
			@RequestParam String pCatagory, @RequestParam MultipartFile[] pPhoto) throws IOException {
		
		List<BlogPhotos> blogPhoto= new LinkedList<>();
		BlogParagraph bp = new BlogParagraph();
		for(MultipartFile photo : pPhoto) {
		

		BlogPhotos bPhoto = new BlogPhotos();
		byte[] photoByte = photo.getBytes();
		
		bp.setParagraphTime(new Timestamp(new Date().getTime()));
		bp.setParagraphTitle(pTitle);
		bp.setParagraphContent(pContent);
		bp.setParagraphAuther(pAuther);
		bp.setParagraphCatagory(pCatagory);
		bPhoto.setBlogPhoto(photoByte);
		bPhoto.setBlogparagraph(bp);
		blogPhoto.add(bPhoto);
//		bp.set
//
//		blogParaService.insertBlog(bp);
		}
		bp.setBlogPhotos(blogPhoto);
		blogParaService.insertBlog(bp);
		return "redirect:/blog/backIndex";
	}

	@PostMapping("/blog/getAllBlogParagraph")
	@ResponseBody
	public List<BlogParagraph> getAllBlogParagraph() {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();

		return allBlogParagraph;
	}
	@GetMapping("/blog/getAllBlogParagraphForMonthSelect")
	@ResponseBody
	public List<BlogParagraph> getAllBlogParagraphForMonthSelect() {
		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraphforMonthselect();

		return allBlogParagraph;
	}

//	@GetMapping("/blog/getAllBlogParagraphMVC")
//	public String getAllBlogParagraphMVC(Model m) {
//		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();
//
//		m.addAttribute("paraList", allBlogParagraph);
//
//		return "/blog/fakeIndex_mvc";
//	}
	@DeleteMapping("/blog/deleteParaById")
	@ResponseBody
	public String deleteParaById(@RequestParam Integer id) {
		System.out.println(id);
		blogParaService.deleteParaById(id);
		return "delete success";
	}
	@ResponseBody
	@PutMapping("/blog/updatePara")
	public String updatePara(@RequestParam Integer id,@RequestParam String pTitle,@RequestParam String pContent,@RequestParam String pAuther,@RequestParam String pCatagory,@RequestParam(name = "pPhoto",required = false ) MultipartFile[] pPhoto){
	
		blogParaService.updatePara(id, pTitle, pContent, pAuther, pCatagory, pPhoto);
	return "成功";
	}
	
//	@ResponseBody
	@GetMapping("/blog/getParaById")
	public String getParaById(@RequestParam("id") Integer id,Model model) {
	BlogParagraph bp=blogParaService.getParaById(id);
	model.addAttribute("updateBlog",bp);
		return "/blog/updatePara";
	}
	
	@ResponseBody
	@PutMapping("/blog/showPara/{id}/{showOrNot}")
	public String updateShowOrNot(@PathVariable("id") Integer pId, @PathVariable("showOrNot") Integer showOrNot) {
		return blogParaService.makeItCanSeen(pId, showOrNot);
	}
	
	@ResponseBody
	@GetMapping("/blog/showLatestPara")
	public BlogParagraph findLatestParaByIdNativeQuery() {
		
		return blogParaService.findLatestParaByIdNativeQuery();
	}
	
	@ResponseBody
	@GetMapping("/blog/catagory1")
	public List<BlogParagraph> findCatagory1NativeQuery(Model m) {
		List<BlogParagraph> catagory1 = blogParaService.findCatagory1NativeQuery();
		
		m.addAttribute("cat1ParaList", catagory1);
		return blogParaService.findCatagory1NativeQuery();
		}
//	@GetMapping("/blog/getAllBlogParagraphMVC")
//	public String getAllBlogParagraphMVC(Model m) {
//		List<BlogParagraph> allBlogParagraph = blogParaService.getAllBlogParagraph();
//
//		m.addAttribute("paraList", allBlogParagraph);
//
//		return "/blog/fakeIndex_mvc";
//	}
	@PostMapping("/blog/getArchive")
	@ResponseBody
	public List<BlogParagraph> findParaByMonthNativeQuery(@RequestParam String year,@RequestParam String month){
		return blogParaService.findParaByMonthNativeQuery(year,month);
		
	}
	
	}

