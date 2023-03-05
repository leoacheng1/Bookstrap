//package com.bookstrap.model;
//
//import java.util.List;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//
//public interface NewScheduleRepository extends JpaRepository<NewSchedule,Integer> {
//
//	@Query(value="SELECT  ShopEmployeesSchedule.schedule_id, ShopEmployeesSchedule.schedule_enddate,"
//			+ "ShopEmployeesSchedule.schedule_startdate, ShopEmployeesSchedule.schedule_vacation, ShopEmployees.emp_id,"
//			+ "ShopEmployees.emp_name"
//			+ " FROM ShopEmployees INNER JOIN"
//			+ " ShopEmployeesSchedule ON ShopEmployees.emp_id = ShopEmployeesSchedule.schedule_empid",nativeQuery = true)
//	public List<NewSchedule> newSchedule();
//}
