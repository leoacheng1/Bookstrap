package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.model.UserCouponRepository;

@Service
@Transactional
public class UserCouponService {
	
	@Autowired
	private UserCouponRepository ucDao;
	
	
	public List<UserCoupon> findCouponsByMemberId(Integer memberId){
		return ucDao.findCouponIdByMemberId(memberId);
	}
	
	public List<Coupons> findCouponsByCouponId(Integer couponId){
		return ucDao.findCouponsByCouponId(couponId);
	}

}
