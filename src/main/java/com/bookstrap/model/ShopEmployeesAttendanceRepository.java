package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.ShopEmployeesAttendance;

public interface ShopEmployeesAttendanceRepository extends JpaRepository<ShopEmployeesAttendance, Integer> {

	@Modifying
	@Query(value="select * from ShopEmployeesAttendance where attend_empid = :attSempid")
	public List<ShopEmployeesAttendance> selectShopEmployeesAttendanceByIdQuery(@Param("attSempid") Integer attSempid); 
	
}
