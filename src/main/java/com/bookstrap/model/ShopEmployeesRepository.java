package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.ShopEmployees;

public interface ShopEmployeesRepository extends JpaRepository<ShopEmployees, Integer> {
	
	@Modifying
	@Query(value="DELETE FROM ShopEmployees WHERE empId= :id")
	public void deleteByIdQuery(@Param("id") Integer id); 
	
//	@Modifying
//	@Query(value="select ShopEmployees.emp_id,ShopEmployees.emp_name from ShopEmployees",nativeQuery = true)
//	public List<ShopEmployees> getAllIdNameByShopEmployees();
}
