package com.bookstrap.harry.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	@GetMapping("/favorite/ebook/add")
	public String addEBookFavorite(@RequestParam("eBookId") EBooks eBook, 
			@RequestParam("member") Members member) {
//		System.out.println("name:  =============" + eBook.geteBookName());	
		
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
	
	@PostMapping("/favorite/ebook/add")
	@ResponseBody
	public String addEBookFavorite2(@RequestParam("eBookId") EBooks eBook, 
			@RequestParam("memberId") Members member) {
//		System.out.println("name:  =============" + eBook.geteBookName());	
		
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
			return "Y";
		}
		
//		EBookFavorite eBookFavorite = new EBookFavorite();
//		eBookFavorite.seteBook(eBookId);
//		
//		eBookFavorite.setMember(member);
//		
//		ebfService.insertEbookFavority(eBookFavorite);
		
		return "N";
		
	}
	
	
	
	@ResponseBody
	@PostMapping("/favorite/ebook/checkfavority")
	public Map<String, String> checkList(@RequestParam("eBookId") Integer eBook, 
			@RequestParam("memberId") Integer member){
			
		
		Members memberObj = new Members();
		memberObj.setMemberId(member);
		
		EBooks eBookObj = new EBooks();
		eBookObj.seteBookId(eBook);
		
		System.out.println("=================");
		
		HashMap<String, String> map = new HashMap<>();
		Optional<EBookFavorite> op = ebfService.finByMemberAndEBook(memberObj, eBookObj);
		
		if(op.isPresent()) {
			map.put("response", "Y");
			return map;
		}
		map.put("response", "N");
		return map;
	
	}

}
