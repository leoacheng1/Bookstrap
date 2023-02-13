package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.ShopEmployees;

public interface ShopEmployeesRepository extends JpaRepository<ShopEmployees, Integer> {
	
}
