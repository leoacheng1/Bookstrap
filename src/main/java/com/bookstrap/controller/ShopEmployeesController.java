package com.bookstrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.service.ShopEmployeesService;



	@Controller
	public class ShopEmployeesController {

	  @Autowired
	  private ShopEmployeesService sempService;
	  
	  @GetMapping("/semps/home")
		public String uploadPage() {
			return "semps/home";
		}

	  @PostMapping("/semps/insert")
	  public ShopEmployees addShopEmployee(@RequestBody ShopEmployees shopEmployee) {
		 return sempService.addShopEmployee(shopEmployee);
	  }
	}


