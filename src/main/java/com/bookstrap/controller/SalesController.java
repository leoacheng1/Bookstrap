package com.bookstrap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstrap.service.SalesService;

@Controller
@RequestMapping("/shipping")
public class SalesController {

	@Autowired
	private SalesService sService;
	
	
}
