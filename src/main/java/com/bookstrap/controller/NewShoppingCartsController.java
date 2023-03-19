package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.model.Shops;
import com.bookstrap.model.bean.NewShoppingCarts;
import com.bookstrap.service.NewShoppingCartsService;
import com.bookstrap.service.ShopsService;
import com.bookstrap.service.UserCouponService;

@Controller
@RequestMapping("/newshopping")
public class NewShoppingCartsController {

	@Autowired
	private NewShoppingCartsService nscService;
	
	@Autowired
	private MemberDdetailService mdService;
	
	@Autowired
	private UserCouponService ucService;
	
	@Autowired
	private ShopsService shService;

	// 將商品加入購物車清單
	@ResponseBody
	@PostMapping("/buy")
	public String insertCartItems(HttpSession session, @RequestParam("bookId") Integer bookId,
			@RequestParam("amount") Integer amount, @RequestParam("disPrice") Integer Price) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId != null) {
		NewShoppingCarts newShoppingCarts = new NewShoppingCarts();
		newShoppingCarts.setMemberId(memberId);
		newShoppingCarts.setBookId(bookId);
		newShoppingCarts.setAmount(amount);
		newShoppingCarts.setPrice(Price);

		nscService.insert(newShoppingCarts);
		return "success";
		}
		return "member/SignInPage";
	}

	// 透過session 中的 memberId 取得所有購買的商品
	@GetMapping("/newcart")
	public String findCartsByMemberId(HttpSession session, Model model) {
		// 從 session 中取得 memberId
		Integer memberId = (Integer) session.getAttribute("memberId");

		if (memberId != null) {
			List<NewShoppingCarts> cartItemList = nscService.findCartIdByMemberId(memberId);
			System.out.println(cartItemList);
			model.addAttribute("cartItemList", cartItemList);
			List<UserCoupon> userCouponList = ucService.findCouponsByMemberId(memberId);
			List<Coupons> coupons = new ArrayList<Coupons>();
			for (int n = 0; n < userCouponList.size(); n++) {
				Coupons coupon = userCouponList.get(n).getCoupon();
				coupons.add(coupon);
			}
			model.addAttribute("userCouponList", userCouponList);
			model.addAttribute("coupons", coupons);
			return "shoppingcarts/newshoppingcarts";
		}
		return "member/SignInPage";
	}

	// 清除購物車中其中一樣商品
	@ResponseBody
	@DeleteMapping("/newcart/delete")
	public String deleteCartItem(Integer cartId) {
		nscService.deleteByCartId(cartId);
		return "success";
	}

	// 清空購物車
	@DeleteMapping("/newcart/clear")
	public String deleteAllCartItems(Integer memberId) {
		nscService.deleteAllByMemberId(memberId);
		return "redirect:/newcart";
	}

	// 更新商品數量
	@ResponseBody
	@PutMapping("/newcart/api/update")
	public Integer updateCartItemAmount(@RequestParam("cartId") Integer cartId,
			@RequestParam("amount") Integer amount) {
		nscService.updateAmountByCartId(amount, cartId);
		return amount;

	}
	
	@PostMapping("/newcart/checkout")
	@ResponseBody
	public String checkout(HttpSession session, @RequestBody List<Integer> bookIds) {
		session.setAttribute("bookIds", bookIds);

		System.out.println("已存入session");
		return "redirect:/newcart/shipping";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/newcart/shipping")
	public String getCartItems(ModelMap model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");

		if (memberId != null) {
			MemberDetails memberDetails = mdService.findMemberDetailsById(memberId);
			String memberFullName = memberDetails.getMemberLastName() + memberDetails.getMemberFirstName();
			session.setAttribute("memberDetails", memberDetails);
			session.setAttribute("memberFullName", memberFullName);

			List<Shops> allShop = shService.findAllShop();
			
			
			List<Integer> bookIds = (List<Integer>) session.getAttribute("bookIds");
			System.out.println(bookIds);
			List<NewShoppingCarts> cartItemList = nscService.findCartByBookId(bookIds);
			model.addAttribute("shopList", allShop);
			model.addAttribute("cartItemList", cartItemList);

			return "shoppingcarts/orders";
		}
		return "member/SignInPage";
	}
}
