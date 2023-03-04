package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.model.bean.ShopEmployeesSchedule;
import com.bookstrap.service.ShopEmployeesScheduleService;

@Controller
public class ShopEmployeesScheduleController {

	@Autowired
    private ShopEmployeesScheduleService sempscheService;
	
	@GetMapping("/sempsche/showpage")
	public String showPage(Model m) {
		List<ShopEmployeesSchedule> sempsche = sempscheService.getAllShopEmployeesSchedule();
		m.addAttribute("sempsche",sempsche);
		return "shopemployees/showsempsche";

	}
	
	@GetMapping("/sempsche/showall")
	@ResponseBody
	public List<ShopEmployeesSchedule> findAll(){
		return sempscheService.getAllShopEmployeesSchedule();
		
	}
	
	@PostMapping("/sempsche/insertpage")
	public String insertSchedule() {
		
		return "shopemployees/home";
	}
}
