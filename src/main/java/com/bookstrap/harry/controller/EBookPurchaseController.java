package com.bookstrap.harry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String addEBookPurchase(@RequestParam("nTcId") Integer nTcId, Model m) {
		
		TestCheckout texkCheckout = tcService.findTscById(nTcId);
		Members getMemberId = texkCheckout.getTsc().getMember();
		EBooks geteBookId = texkCheckout.getTsc().geteBook();
		
		
		EBookPurchases eBookPurchase = new EBookPurchases();
		eBookPurchase.setMember(getMemberId);
		eBookPurchase.seteBook(geteBookId);
		eBookPurchase.setPurchaseStatus(false);
		EBookPurchases purchaseEbook = ebpService.insertEBookPurchase(eBookPurchase);
		
		//傳送給某頁面，利用member與eBook找到該筆PurchaseID
		m.addAttribute("purchase", purchaseEbook);
		
		//應轉向某後段確認頁面
		return "member/Test/Test";
	}
	
	
	//某controller執行後確認交易，並確認購買使會員成功購買
	//利用前一個controller傳入的purchase 去查purchase ID
	@GetMapping("/ebook/add/purchase/after/pay")
	public String completeEBookPurchase(@RequestParam("purchase") Integer purchaseId) {
		
		System.out.println("XXXXXXXXXX" + purchaseId);
		EBookPurchases eBookPurchase = ebpService.findById(purchaseId);
		
		
		
		eBookPurchase.setPurchaseStatus(true);
		ebpService.insertEBookPurchase(eBookPurchase);
		return "redirect:/ebook/get/allebook";
	}
	
}
