package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.Coupons;

public interface CouponRepository extends JpaRepository<Coupons, Integer> {

}
