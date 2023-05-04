package com.bookstrap.harry.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ContentDisposition;
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
	
	@GetMapping("/epub/htmlindex")
	public String toEpubIndex() {
		return "member/ePub/EpubIndex";
	}
	
	@GetMapping("/epub/index")
	public String toEpubIndex2() {
		return "member/ePub/Viewer";
	}
	
	@GetMapping("/epub/Viewer2")
	public String toEpubIndex3() {
		return "member/ePub/Viewer2";
	}
	
//	@GetMapping("/epub/books1/{id}")
//    public String showBook(@PathVariable Long id, Model model) {
//        String filePath = "C:\\epub\\1010490076.epub";
//        String html = ePubSevice.getBookHtml(filePath);
//        model.addAttribute("html", html);
//        return "";
//    }
	
	 @GetMapping("/epub/books/{id}")
	    public ResponseEntity<String> showBook(@PathVariable Long id) {
	        String filePath = "C:\\epub\\1010490082.epub";
	        String html = ePubSevice.getBookHtml(filePath);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.TEXT_HTML);
	        return new ResponseEntity<>(html, headers, HttpStatus.OK);
	    }
	
	 @GetMapping("/epub/ebook/{id}")
	 public ResponseEntity<byte[]> getEPUB(@PathVariable String id) throws IOException{
		 String filePath = "C:\\Bookstrap\\epub\\" + id ;
		 File file = new File(filePath);
		 if (file.exists()) {
			 System.out.println("fileExistedfsfwfwefwefwef");
		 }
		 FileInputStream fileInputStream = new FileInputStream(file);
		 byte[] fileByte = fileInputStream.readAllBytes();
		 fileInputStream.close();
		 
		 HttpHeaders header = new HttpHeaders();
//		 header.setContentType(MediaType.);
		 header.add(HttpHeaders.CONTENT_TYPE, "application/epub+zip");
		 header.setContentDisposition(ContentDisposition.attachment().filename("xxxx.epub", StandardCharsets.UTF_8).build());
		 
		 return new ResponseEntity<>(fileByte, header, HttpStatus.OK);
	 }
	
}


