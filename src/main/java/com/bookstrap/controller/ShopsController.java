package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.model.Shops;
import com.bookstrap.service.ShopsService;

@Controller
public class ShopsController {
	
	@Autowired
	private ShopsService shService;
	
	
	@GetMapping("/shops/home")
	public String uploadPage() {
		return "shop/shophome";
	}
    @ResponseBody
	@PostMapping("/shops/add")
	public Shops insert(@RequestBody Shops sh) {
		return shService.insertShop(sh);
	}
    @ResponseBody
    @GetMapping("/shops/all")
	public List<Shops> findAllCustomer() {
		return shService.findAllShop();
	}
}
