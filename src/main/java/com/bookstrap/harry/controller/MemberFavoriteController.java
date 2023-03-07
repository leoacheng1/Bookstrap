package com.bookstrap.harry.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.EBookFavorityService;

@Controller
public class MemberFavoriteController {

	@Autowired
	private EBookFavorityService ebfService;
	
	@GetMapping("/favorite/ebook/add")
	public String addEBookFavorite(@RequestParam("eBookId") Integer eBookId, @RequestParam("member") Members member) {
		
		System.out.println("=====================" );
		System.out.println("Get eBookID:" + eBookId);
		
			EBooks eBook = new EBooks();
			eBook.seteBookId(eBookId);
			
			
			EBookFavorite eBookFavorite = new EBookFavorite();
			eBookFavorite.seteBook(eBook);
			System.out.println("eBookID:" + eBook.geteBookId());
			
			eBookFavorite.setMember(member);
			
			ebfService.insertEbookFavority(eBookFavorite);
		
			
			return "member/TestSuccess";
			
	}

}
