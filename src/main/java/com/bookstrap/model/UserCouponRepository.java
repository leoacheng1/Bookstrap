package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstrap.harry.bean.Coupons;
import com.bookstrap.harry.bean.UserCoupon;
import com.bookstrap.model.pk.UserCouponPK;

public interface UserCouponRepository extends JpaRepository<UserCoupon, UserCouponPK> {
	
	@Query(value = "from UserCoupon where memberId = :memberId")
	public List<UserCoupon> findCouponIdByMemberId(Integer memberId);
	
	@Query(value = "from Coupons where couponId = :couponId")
	public List<Coupons> findCouponsByCouponId(Integer couponId);
	
}
