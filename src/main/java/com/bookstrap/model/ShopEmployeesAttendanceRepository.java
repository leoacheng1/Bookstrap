package com.bookstrap.model;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.model.bean.ShopEmployeesAttendance;

public interface ShopEmployeesAttendanceRepository extends JpaRepository<ShopEmployeesAttendance, Integer> {

	@Modifying
	@Query(value = "select * from ShopEmployeesAttendance where attend_empid =:attSempid", nativeQuery = true)
	public List<ShopEmployeesAttendance> selectShopEmployeesAttendanceByIdQuery(@Param("attSempid") Integer attSempid);

	@Query("SELECT s.attId FROM ShopEmployeesAttendance s "
			+ "WHERE s.attStartDate = :attStartDate AND s.attEndDate = :attEndDate "
			+ "AND s.attVacation = :attVacation AND s.attSemps.empId = :empId")
	List<Integer> findAttendanceByCriteria(@Param("attStartDate") LocalDate attStartDate,
			@Param("attEndDate") LocalDate attEndDate, @Param("attVacation") String attVacation,
			@Param("empId") Integer empId);

	@Modifying
	@Query("UPDATE ShopEmployeesAttendance s SET s.attAgree='已提交' WHERE s.attId=:attId")
	int updateAttendanceAgreeById(@Param("attId") Integer attId);

}
