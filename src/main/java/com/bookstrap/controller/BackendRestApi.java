package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bookstrap.model.bean.AccountLabel;
import com.bookstrap.model.dao.AccountMailRepository;
import com.bookstrap.service.EmployeesService;
import com.bookstrap.service.MailService;

@RestController
public class BackendRestApi {
	
	@Autowired
	private EmployeesService empService;
	
	@Autowired
	private MailService mailService;
	@Autowired
	private AccountMailRepository amdao;
	@GetMapping("employee/photo/{username}")
	public byte[] getUserPhoto(@PathVariable("username") String username) {
		return empService.findempPhotoByUsername(username);
	}
	
	//=================================Mail Controller=============================================//
	@GetMapping("test/test")
	public Long test() {
		return mailService.getMailCountInLabel(49,2);
	}

}
