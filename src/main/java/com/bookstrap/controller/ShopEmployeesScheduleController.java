package com.bookstrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.service.ShopEmployeesScheduleService;

@Controller
public class ShopEmployeesScheduleController {

	@Autowired
    private ShopEmployeesScheduleService sempscheService;
	
	@GetMapping("/sempsche/insertpage")
	public String insertPage() {
		return "shopemployees/insertsempsche";
	}
}
