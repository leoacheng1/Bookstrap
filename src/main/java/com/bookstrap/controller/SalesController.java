package com.bookstrap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.service.NewShoppingCartsService;
import com.bookstrap.service.SaleItemsService;
import com.bookstrap.service.SalesService;

@Controller
@RequestMapping("/shipping")
public class SalesController {

	@Autowired
	private NewShoppingCartsService nscService;

	@Autowired
	private SalesService sService;

	@Autowired
	private SaleItemsService siService;

	// 結帳後送出訂單
	@PostMapping("/checkout")
	public String checkout(@RequestParam("totalPrice") Integer totalPrice, @RequestParam("address") String address,
			@RequestParam("delivery") String delivery, @RequestParam("payment") String payment,
			@RequestParam("pay") String pay, @RequestParam("status") String status, HttpSession session,
			@RequestParam("saleItems[0].bookId") Integer bookId0, @RequestParam("saleItems[0].amount") Integer amount0,
			@RequestParam("saleItems[1].bookId") Integer bookId1,
			@RequestParam("saleItems[1].bookId") Integer amount1) {

		Integer memberId = (Integer) session.getAttribute("memberId");

		// create a Sales object
		Sales sales = new Sales();
		sales.setMemberId(memberId);
		sales.setAddress(address);
		sales.setDelivery(delivery);
		sales.setPayment(payment);
		sales.setPay(pay);
		sales.setStatus(status);
		sales.setTotalPrice(totalPrice);

		sService.insert(sales);

		// 設定 saleItems 的 saleId
		SaleItems saleItems0 = new SaleItems();
		saleItems0.setBookId(bookId0);
		saleItems0.setSaleId(sales.getSaleId());
		saleItems0.setAmount(amount0);
		siService.insert(saleItems0);

		if (bookId1 == null) {
			System.out.println("無此筆資料");
		} else {
			SaleItems saleItems1 = new SaleItems();
			saleItems1.setBookId(bookId1);
			saleItems1.setSaleId(sales.getSaleId());
			saleItems1.setAmount(amount1);
			siService.insert(saleItems1);
		}

		// 清空購物車
		System.out.println(memberId);
		nscService.deleteAllByMemberId(memberId);
		session.removeAttribute("cartItemList");

		// return a success response
		return "shoppingcarts/checkout";
	}
	
//	@GetMapping("/checkorder")
//	public String findAllOrders() {
//		sService.findAllSales();
//		return "backend/controllpanel/admin/shop/showorders";
//	}
	
	

	@GetMapping("/checkorder")
	  public String search(
	                       @RequestParam(name = "page", defaultValue = "1") int pageNumber,
	                       Model model) {
	    Page<Sales> salesPage = sService.searchBySaleId(pageNumber);
	    model.addAttribute("salesPage", salesPage);
	    System.out.println(salesPage);
	    return "backend/controllpanel/admin/shop/showorders";
	  }
}
