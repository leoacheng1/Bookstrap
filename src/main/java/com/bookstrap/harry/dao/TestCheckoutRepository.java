package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.TestCheckout;

public interface TestCheckoutRepository extends JpaRepository<TestCheckout, Integer> {

	@Query(value = "FROM TestCheckout tc WHERE tc.tcId=:tcId")
	public TestCheckout findnTscById(@Param("tcId") Integer nTcId);
}
