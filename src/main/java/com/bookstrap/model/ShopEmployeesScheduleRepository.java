package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstrap.model.bean.ShopEmployeesSchedule;

public interface ShopEmployeesScheduleRepository extends JpaRepository<ShopEmployeesSchedule,Integer> {
	
}

