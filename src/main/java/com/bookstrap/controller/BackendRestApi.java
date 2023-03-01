package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.dao.AccountMailRepository;
import com.bookstrap.model.pk.AccountMailPK;
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
	@GetMapping("/test/test")
	public void test() {
		AccountMailPK pk = new AccountMailPK(77,2);
		Page<AccountMail> find = amdao.findByAccountMailIdAndAccountLabelsLabelId(pk, 22, PageRequest.of(0, 1));
		System.out.println(find.getNumberOfElements());
		List<AccountMail> content = find.getContent();
		for (AccountMail mail : content) {
			System.out.println(mail.getMail().getMailContent());			
		}
	}
}
