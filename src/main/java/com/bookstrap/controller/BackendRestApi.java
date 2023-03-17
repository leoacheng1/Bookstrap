package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.bean.ConditionDto;
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
	@PostMapping("test/test")
	public List<AccountMail> test(@RequestBody ConditionDto dto) {
		return mailService.findMailByConditions(dto,1,2);
	}

}
