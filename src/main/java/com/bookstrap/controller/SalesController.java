package com.bookstrap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.service.SalesService;

@Controller
@RequestMapping("/shipping")
public class SalesController {

	@Autowired
	private SalesService sService;

	@PostMapping("/checkout")
	public String checkout(@RequestParam("totalPrice")Integer totalPrice , @RequestParam("address") String address,
			@RequestParam("delivery") String delivery, @RequestParam("payment") String payment,
			@RequestParam("pay") String pay,
			@RequestParam("status") String status, HttpSession session, @RequestParam("saleItems") List<SaleItems> saleItems) {
		
		Integer memberId = (Integer) session.getAttribute("memberId");
		
		// create a Sales object
	    Sales sales = new Sales();
	    sales.setMemberId(memberId);
	    sales.setAddress(address);
	    sales.setDelivery(delivery);
	    sales.setPayment(payment);
	    sales.setPay(pay);

	    sales.setStatus(status);
	        
	    // create SaleItems objects and associate them with Sales object
	    for (SaleItems item : saleItems) {
	        item.setSale(sales);
	    }
	        
	    // save Sales and SaleItems to the database
	    sService.checkout(sales, saleItems);
	        
	    // return a success response
	    return "Checkout success!";
	}
	
}
