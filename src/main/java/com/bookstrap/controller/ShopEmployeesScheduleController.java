package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	private ShopEmployeesService sempService;
	

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
	public List<ShopEmployeesDto> findAllEmployees(){
		return sempService.getAllIdNameByShopEmployees();
		
	}
	
	@ResponseBody
	@PostMapping("/sempsche/addsemp")
	public String addSchedule(@RequestParam("scheduleVacation") String scheduleVacation,@RequestParam("scheduleVacation") Integer id) {
		try {
			ShopEmployeesSchedule sempsche = new ShopEmployeesSchedule();
			sempsche.setScheduleVacation(scheduleVacation);
			sempsche.setScheduleEmpid(id);
			sempscheService.addShopEmployeesSchedule(sempsche);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   return "shopemployees/home";
	}

}
