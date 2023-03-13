package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.Sales;

public interface SalesRepository extends JpaRepository<Sales, Integer> {

}
