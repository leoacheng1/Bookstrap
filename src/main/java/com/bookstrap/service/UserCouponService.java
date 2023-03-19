package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.model.UserCouponRepository;
import com.bookstrap.model.dao.CouponRepository;
import com.bookstrap.model.pk.UserCouponPK;

@Service
@Transactional
public class UserCouponService {
	
	@Autowired
	private UserCouponRepository ucDao;
	
	@Autowired
	private CouponRepository cDao;
	
	public void insert(Integer memberId) {
		Coupons coupon = new Coupons();
		coupon.setCouponId(1);
		coupon.setDiscount(200);
		coupon.setName("會員註冊禮");
		if(cDao.findById(1).isEmpty()) {
			cDao.save(coupon);
		}
		
		
		UserCoupon userCoupon = new UserCoupon();
		userCoupon.setCouponId(1);
		userCoupon.setMemberId(memberId);
		userCoupon.setAmount(1);
		ucDao.save(userCoupon);
	}
	
	public List<UserCoupon> findCouponsByMemberId(Integer memberId){
		
		return ucDao.findCouponIdByMemberId(memberId);
	}
	
	public List<Coupons> findCouponsByCouponId(Integer couponId){
		return ucDao.findCouponsByCouponId(couponId);
	}

	public void deleteById(Integer couponId, Integer memberId) {
		UserCouponPK userCouponPK = new UserCouponPK(couponId, memberId);
		ucDao.deleteById(userCouponPK);
	}
}
