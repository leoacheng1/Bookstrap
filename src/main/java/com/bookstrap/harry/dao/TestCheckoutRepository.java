package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.TestCheckout;

public interface TestCheckoutRepository extends JpaRepository<TestCheckout, Integer> {

}
