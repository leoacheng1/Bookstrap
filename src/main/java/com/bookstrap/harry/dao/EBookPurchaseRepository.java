package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.EBookPurchases;

public interface EBookPurchaseRepository extends JpaRepository<EBookPurchases, Integer> {

}
