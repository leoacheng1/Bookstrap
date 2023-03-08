package com.bookstrap.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.model.NewScheduleDto;
import com.bookstrap.model.ShopEmployeesDto;
import com.bookstrap.model.bean.ShopEmployeesSchedule;
import com.bookstrap.service.ShopEmployeesScheduleService;
import com.bookstrap.service.ShopEmployeesService;

@Controller
public class ShopEmployeesScheduleController {


	@Autowired
    private ShopEmployeesScheduleService sempscheService;
	
	
	@Autowired
	private ShopEmployeesService sempsService;
	
	

	@GetMapping("/sempsche/showpage")
	public String insertSchedule() {
		
		return "shopemployees/showsempsche";
	}
	
	@GetMapping("/sempsche/showsche")
	@ResponseBody
	public List<NewScheduleDto> findAll(){
		return sempscheService.getAllSchedules();
	}
	
	@GetMapping("/sempsche/showsemp")
	@ResponseBody
	public List<ShopEmployeesDto> get(){
		return sempsService.getAllIdNameByShopEmployees();
	}
	
	@ResponseBody
	@GetMapping("/sempsche/addsemp")
	public String addSchedule(
			@RequestParam("scheduleEmpid") Integer scheduleEmpid,
			@RequestParam("scheduleStartdate")@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") Date scheduleStartdate,
			@RequestParam("scheduleEnddate")@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") Date scheduleEnddate) {
		try {
			ShopEmployeesSchedule sempsche = new ShopEmployeesSchedule();
			sempsche.setScheduleEmpid(scheduleEmpid);
			sempsche.setScheduleStartdate(scheduleStartdate);
			sempsche.setScheduleEnddate(scheduleEnddate);
			sempscheService.addShopEmployeesSchedule(sempsche);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   return "shopemployees/home";
	}

}
