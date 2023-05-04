package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.service.UserCouponService;

@Controller
public class UserCouponController {

	@Autowired
	private UserCouponService ucService;

	@GetMapping("/mycoupon")
	public String findCouponsByMemberId(ModelMap model, HttpSession session) {

		Integer memberId = (Integer) session.getAttribute("memberId");

		if (memberId != null) {
			List<UserCoupon> userCouponList = ucService.findCouponsByMemberId(memberId);
	
			List<Coupons> coupons = new ArrayList<Coupons>();
			for (int n = 0; n < userCouponList.size(); n++) {
				Coupons coupon = userCouponList.get(n).getCoupon();
				coupons.add(coupon);
			}
			model.addAttribute("userCouponList", userCouponList);
			model.addAttribute("coupons", coupons);
			return "member/Main/MyCoupon";
		}
		return "member/SignInPage";
	}
}
