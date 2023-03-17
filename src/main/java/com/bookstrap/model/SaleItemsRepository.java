package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.SaleItems;

public interface SaleItemsRepository extends JpaRepository<SaleItems, Integer> {

}
