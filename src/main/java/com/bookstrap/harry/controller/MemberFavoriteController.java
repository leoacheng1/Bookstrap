package com.bookstrap.harry.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.EBookFavorityService;

@Controller
public class MemberFavoriteController {

	@Autowired
	private EBookFavorityService ebfService;
	
//	@ResponseBody
	@GetMapping("/favorite/ebook/add")
	public String addEBookFavorite(@RequestParam("eBookId") EBooks eBook, 
			@RequestParam("member") Members member) {
		
		
		List<EBookFavorite> favorites = ebfService.getBookFavoriteByMember(member);
		 boolean alreadyFavorite = false;
		for(EBookFavorite favorite : favorites) {
			if(favorite.geteBook().geteBookId().equals(eBook.geteBookId())) {
				alreadyFavorite = true;
				ebfService.deleteEBookFavorite(member, eBook);
				
				break;
				
			}
					}
		if(!alreadyFavorite) {
			
			
			EBookFavorite eBookFavorite = new EBookFavorite();
			eBookFavorite.seteBook(eBook);
			
			eBookFavorite.setMember(member);
			
			ebfService.insertEbookFavority(eBookFavorite);
			return "redirect:/ebook/get/allebook";
		}
		
//		EBookFavorite eBookFavorite = new EBookFavorite();
//		eBookFavorite.seteBook(eBookId);
//		
//		eBookFavorite.setMember(member);
//		
//		ebfService.insertEbookFavority(eBookFavorite);
		
		return "redirect:/ebook/get/allebook";
			
	}

}
