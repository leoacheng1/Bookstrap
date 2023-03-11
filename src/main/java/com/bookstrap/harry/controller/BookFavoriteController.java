package com.bookstrap.harry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Favorite;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.BookFavorityService;
import com.bookstrap.model.Books;

@Controller
public class BookFavoriteController {
	
	@Autowired
	private BookFavorityService bfService;
	
	@GetMapping("/favorite/book/add")
	public String addEBookFavorite(@RequestParam("id") Books book, 
			@RequestParam("member") Members member) {
		
		List<Favorite> favorites = bfService.getBookFavoriteByMember(member);
		 boolean alreadyFavorite = false;
		 
		for(Favorite favorite : favorites) {
			if(favorite.getBook().getId().equals(book.getId())) {
				alreadyFavorite = true;
				bfService.deleteBookFavorite(member, book);
				
				break;
				
			}
					}
		if(!alreadyFavorite) {
			
			
			
			Favorite bookFavorite = new Favorite();
			bookFavorite.setBook(book);
			bookFavorite.setMember(member);
			bfService.insertEbookFavority(bookFavorite);
			//頁面要導向商城非ebook
			return "redirect:/ebook/get/allebook";
		}
		
		
		return "redirect:/ebook/get/allebook";
			
	}
	
	//主要用的是這個
	@PostMapping("/favorite/book/add")
	@ResponseBody
	public String addEBookFavorite2(@RequestParam("id") Books book, 
			@RequestParam("memberId") Members member) {
		
		List<Favorite> favorites = bfService.getBookFavoriteByMember(member);
		 boolean alreadyFavorite = false;
		 
		for(Favorite favorite : favorites) {
			if(favorite.getBook().getId().equals(book.getId())) {
				alreadyFavorite = true;
				bfService.deleteBookFavorite(member, book);
				
				break;
				
			}
					}
		if(!alreadyFavorite) {
			
			
			
			Favorite bookFavorite = new Favorite();
			bookFavorite.setBook(book);
			bookFavorite.setMember(member);
			bfService.insertEbookFavority(bookFavorite);
			//頁面要導向商城非ebook
			return "redirect:/ebook/get/allebook";
		}
		
		
		return "redirect:/ebook/get/allebook";
		
	}
	
}
