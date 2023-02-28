package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.Books;
import com.bookstrap.service.BooksService;
import com.bookstrap.service.ShoppingCartsService;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;
	
	private BooksService bService;
	
	
//	@GetMapping("/cart")
//	public String checkSignIn(HttpSession session) {
//		if (session.getAttribute("member") != null) {
//			return "/shoppingcarts/shoppingcarts";
//		}
//		return "member/SignInPage";
//	}
	
////	@ResponseBody	
//	@GetMapping("/carts")
//	public String findAllCarts(Integer memberId, Model model) {
////		Object id = session.getAttribute("memberId");
////		System.out.println("idclass=" + id.getClass());
//		List<ShoppingCarts> carts = scService.findCartsByMemberId(memberId);
//		model.addAttribute("carts", carts);
//		return "shoppingcarts/shoppingcarts";
//	}
//	
//	@DeleteMapping("/carts/delete")
//	public String deleteCartsByBookId(@RequestParam("bookId") Integer bookId) {
//		scService.deleteCartsByBookId(bookId);
//		return "rediect:shoppingcarts/shoppingcarts";
//	}
	
	@GetMapping("/cart")
    public String findCartItemsByMemberId(Model model, HttpSession session) {
        
        Integer memberId = (Integer) session.getAttribute("memberId");
        System.out.println("memberId:" + memberId);
        if (memberId != null) {
            List<ShoppingCarts> cartItemList = scService.findCartItemsByMemberId(memberId);
      
            
            List<Books> bookList = new ArrayList<Books>();
            int n = 0;
            while(cartItemList.size() > n) {
            
            	 ShoppingCarts list = cartItemList.get(n);
            	System.out.println(list);
            	String name = list.getBook().getName();
            	n++;
            }

//            List<Books> bookList = bService.findBooksByBookId(bookId);
            model.addAttribute("cartItemList", cartItemList);
            return "shoppingcarts/shoppingcarts";
        }
        return "member/SignInPage";
    }
}
