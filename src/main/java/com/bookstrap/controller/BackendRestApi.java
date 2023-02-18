package com.bookstrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bookstrap.service.EmployeesService;

@RestController
public class BackendRestApi {
	
	@Autowired
	private EmployeesService empService;
	
	@GetMapping("employee/photo/{username}")
	public byte[] getUserPhoto(@PathVariable("username") String username) {
		return empService.findempPhotoByUsername(username);
	}
	
}
