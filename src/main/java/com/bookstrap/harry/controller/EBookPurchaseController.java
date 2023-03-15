package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.EBookPurchases;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.bean.TestCheckout;
import com.bookstrap.harry.service.EBookPurchaseService;
import com.bookstrap.harry.service.TestCheckoutSercvice;

@Controller
public class EBookPurchaseController {

	@Autowired
	private TestCheckoutSercvice tcService;
	
	@Autowired
	private EBookPurchaseService ebpService;
	
	//結帳完成但未確認付款
	//這裡的code應該要放在點選結帳的controller
	@GetMapping("/ebook/add/purchase/before/pay")
	public String addEBookPurchase(@RequestParam("nTcId") Integer nTcId) {
		
//		Integer tcId = nTc.getTcId();
//		TestCheckout texkCheckout = tcService.findTscById(tcId);
		
		System.out.println("=======================");
		TestCheckout texkCheckout = tcService.findTscById(nTcId);
		Members getMemberId = texkCheckout.getTsc().getMember();
		EBooks geteBookId = texkCheckout.getTsc().geteBook();
		System.out.println("getMemberId" + getMemberId.getMemberId());
		System.out.println("geteBookId" + geteBookId.geteBookId());
		
		EBookPurchases eBookPurchase = new EBookPurchases();
		eBookPurchase.setMember(getMemberId);
		eBookPurchase.seteBook(geteBookId);
		eBookPurchase.setPurchaseStatus(false);
		ebpService.insertEBookPurchase(eBookPurchase);
		
		
		return "member/Test/Test";
	}
	
	
	
}
