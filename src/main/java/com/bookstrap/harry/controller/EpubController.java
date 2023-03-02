package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bookstrap.harry.service.EpubService;

@Controller
public class EpubController {

	
	@Autowired
	private EpubService ePubSevice;
	
	@GetMapping("/epub/index")
	public String toEpubIndex() {
		return "member/ePub/EpubIndex";
	}
	
//	@GetMapping("/epub/books/{id}")
//    public String showBook(@PathVariable Long id, Model model) {
//        String filePath = "C:\\epub\\1010490076.epub";
//        String html = ePubSever.getBookHtml(filePath);
//        model.addAttribute("html", html);
//        return "book";
//    }
	
	 @GetMapping("/epub/books/{id}")
	    public ResponseEntity<String> showBook(@PathVariable Long id) {
	        String filePath = "C:\\epub\\1010490076.epub";
	        String html = ePubSevice.getBookHtml(filePath);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.TEXT_HTML);
	        return new ResponseEntity<>(html, headers, HttpStatus.OK);
	    }
	
	
}
