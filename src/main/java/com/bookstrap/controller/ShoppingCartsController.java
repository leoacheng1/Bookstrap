package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.model.Books;
import com.bookstrap.service.ShoppingCartsService;
import com.bookstrap.service.UserCouponService;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartsController {

	@Autowired
	private ShoppingCartsService scService;
	
	@Autowired
	private UserCouponService ucService;


//	@GetMapping("/cart")
//	public String checkSignIn(HttpSession session) {
//		if (session.getAttribute("member") != null) {
//			return "/shoppingcarts/shoppingcarts";
//		}
//		return "member/SignInPage";
//	}

//	@ResponseBody	
//	@GetMapping("/carts")
//	public String findAllCarts(Integer memberId, Model model) {
//		Object id = session.getAttribute("memberId");
//		System.out.println("idclass=" + id.getClass());
//		List<ShoppingCarts> carts = scService.findCartsByMemberId(memberId);
//		model.addAttribute("carts", carts);
//		return "shoppingcarts/shoppingcarts";
//	}

	// 透過session 中的 memberId 取得所有購買的商品
	@GetMapping("/cart")
	public String findCartItemsByMemberId(ModelMap model, HttpSession session) {

		// 從 session 中取得 memberId
		Integer memberId = (Integer) session.getAttribute("memberId");
//        System.out.println("memberId:" + memberId);

		if (memberId != null) {
			// 透過 memberId 找尋會員購買的 bookId
			List<ShoppingCarts> cartItemList = scService.findCartItemsByMemberId(memberId);
			List<UserCoupon> userCouponList = ucService.findCouponsByMemberId(memberId);
			// 透過 bookId 拿取 Books 相關資料
			List<Books> bookList = new ArrayList<Books>();
			for (int n = 0; n < cartItemList.size(); n++) {
				Books book = cartItemList.get(n).getBook();
				bookList.add(book);
			}

			model.addAttribute("bookList", bookList);
			model.addAttribute("cartItemList", cartItemList);
			
			List<Coupons> coupons = new ArrayList<Coupons>();
			for (int n = 0; n < userCouponList.size(); n++) {
				Coupons coupon = userCouponList.get(n).getCoupon();
				coupons.add(coupon);
			}
			model.addAttribute("userCouponList", userCouponList);
			model.addAttribute("coupons", coupons);
			return "shoppingcarts/shoppingcarts";
		}
		return "member/SignInPage";
	}

	// 清除購物車中其中一樣商品
	@DeleteMapping("/cart/delete")
	public String deleteCartItem(Integer bookId) {
		scService.deleteBookByBookId(bookId);
		return "redirect:/cart";

	}

	// 清除購物車中所有商品
	@DeleteMapping("/cart/clear")
	public String deleteAllCartItems(Integer memberId) {
		scService.deleteAllByMemberId(memberId);
		return "redirect:/cart";
	}

	// 更新商品數量
	@ResponseBody
	@PutMapping("/cart/api/update")
	public Integer updateCartItemAmount(@RequestParam("bookId") Integer bookId, @RequestParam("amount") Integer amount) {
		ShoppingCarts upAmount = scService.updateAmountByBookId(amount, bookId);
		return upAmount.getAmount();

	}
	
}
