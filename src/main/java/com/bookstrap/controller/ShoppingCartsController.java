package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.SendEmailService;
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

	@Autowired
	private MemberDdetailService mdService;

	@Autowired
	private SendEmailService emailService;

	@ResponseBody
	@PostMapping("/buy")
	public String insertCartItemsByMemberId(HttpSession session, @RequestParam("bookId")Integer bookId, @RequestParam("amount")Integer amount) {
		// 從 session 中取得 memberId
		Integer memberId = (Integer) session.getAttribute("memberId");
		ShoppingCarts shoppingCarts = new ShoppingCarts();
		shoppingCarts.setMemberId(memberId);
		shoppingCarts.setBookId(bookId);
		shoppingCarts.setAmount(amount);
		
		scService.insert(memberId, bookId, amount);
		return "success";
	}

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
	public Integer updateCartItemAmount(@RequestParam("bookId") Integer bookId,
			@RequestParam("amount") Integer amount) {
		ShoppingCarts upAmount = scService.updateAmountByBookId(amount, bookId);
		return upAmount.getAmount();

	}

	@PostMapping("/cart/checkout")
	@ResponseBody
	public String checkout(HttpSession session, @RequestBody List<ShoppingCarts> cartItems) {
		session.setAttribute("cartItems", cartItems);

		System.out.println("已存入session");
		return "redirect:/shipping";
	}

	@GetMapping("/shipping")
	public String getCartItems(ModelMap model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");

		if (memberId != null) {
			MemberDetails memberDetails = mdService.findMemberDetailsById(memberId);
			session.setAttribute("memberDetails", memberDetails);
			String memberFullName = memberDetails.getMemberLastName() + memberDetails.getMemberFirstName();
			session.setAttribute("memberFullName", memberFullName);
			List<ShoppingCarts> cartItemList = scService.findCartItemsByMemberId(memberId);
			session.getAttribute("cartItems");
			System.out.println(session.getAttribute("coupon"));

			return "shoppingcarts/orders";
		}
		return "member/SignInPage";
	}
}
