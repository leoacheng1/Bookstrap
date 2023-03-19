package com.bookstrap.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.Sales;

public interface SalesRepository extends JpaRepository<Sales, Integer> {
	
	List<Sales> findSalesByMemberId(Integer memberId);

	List<Sales> findByMemberId(Integer memberId, Sort sort);

	Page<Sales> findAll(Pageable pageable);
}
