package com.bookstrap.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.model.bean.SalesDTO;
import com.bookstrap.service.NewShoppingCartsService;
import com.bookstrap.service.SaleItemsService;
import com.bookstrap.service.SalesService;
import com.bookstrap.service.UserCouponService;

@Controller
@RequestMapping("/shipping")
public class SalesController {

	@Autowired
	private NewShoppingCartsService nscService;

	@Autowired
	private SalesService sService;

	@Autowired
	private SaleItemsService siService;

	@Autowired
	private UserCouponService ucService;

	// 結帳後送出訂單
	@PostMapping("/checkout")
	public String checkout(@RequestParam("totalPrice") Integer totalPrice, 
						   @RequestParam("address") String address,
						   @RequestParam("delivery") String delivery, 
						   @RequestParam(value = "shop", required = false) Integer shop,
						   @RequestParam("payment") String payment, 
						   @RequestParam("pay") String pay,
						   @RequestParam("email") String email, 
						   @RequestParam("status") String status,
						   @RequestParam(value = "coupon", required = false) Integer coupon, HttpSession session,
						   @RequestParam("bookId") List<Integer> bookId, 
						   @RequestParam("amount") List<Integer> amount)
								   throws UnsupportedEncodingException, MessagingException {

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
		if (shop != null) {
			sales.setShopId(shop);
		}

		sService.insert(sales);

		// 設定 saleItems 的 saleId
		for (int x = 0; x < bookId.size(); x++) {

			SaleItems saleItems = new SaleItems();
			saleItems.setBookId(bookId.get(x));
			saleItems.setAmount(amount.get(x));
			saleItems.setSaleId(sales.getSaleId());
			siService.insert(saleItems);
		}

		// 清空購物車
		nscService.deleteByBookIds(bookId);

		// 清空 session 中的 cartItemList
		session.removeAttribute("cartItemList");
		session.removeAttribute("coupon");

		// 刪除已使用的優惠券
		if(coupon != null) {
			ucService.deleteById(coupon, memberId);
		}

//		// 寄Email
//		sService.sendVertificationEnail(email);
		session.setAttribute("orderId", sales.getSaleId());
		session.setAttribute("amount", sales.getTotalPrice());

		if(payment.equals("line-pay")) {
			return "shoppingcarts/tolineapi";
		}
		return "shoppingcarts/checkout";
	}

	// 查詢所有訂單
	@GetMapping("/checkorder")
	public String search(@RequestParam(name = "page", defaultValue = "1") int pageNumber, Model model) {
		Page<Sales> salesPage = sService.searchBySaleId(pageNumber);
		model.addAttribute("salesPage", salesPage);
		System.out.println(salesPage);
		return "backend/controllpanel/admin/shop/showorders";
	}
	
	

	@PutMapping("/{saleId}/status")
	public ResponseEntity<?> updateSaleStatus(@PathVariable Integer saleId, @RequestBody Map<String, String> request) {
		String newStatus = request.get("status");

		Sales sale = sService.getSalesById(saleId);
		if (sale == null) {
			return ResponseEntity.notFound().build();
		}

		sale.setStatus(newStatus);
		sService.insert(sale);

		return ResponseEntity.ok().build();
	}

	@PutMapping("/{saleId}/pay")
	public ResponseEntity<?> updateSalePayStatus(@PathVariable Integer saleId, @RequestBody Sales request) {
		Sales sale = sService.getSalesById(saleId);
		if (sale == null) {
			return ResponseEntity.notFound().build();
		}
		sale.setPay(request.getPay());
		sService.insert(sale);
		return ResponseEntity.ok().build();
	}

	@GetMapping("/searchByMemberId")
	public ResponseEntity<List<SalesDTO>> searchSalesByMemberId(@RequestParam("memberId") Integer memberId) {
		Sort sort = Sort.by(Sort.Direction.DESC, "saleId");
		List<SalesDTO> saleDTOs = sService.findSalesByMemberId(memberId, sort).stream().map(SalesDTO::new) // 將Sales物件轉換為SaleDTO物件
				.collect(Collectors.toList());
		return ResponseEntity.ok(saleDTOs);
	}
	

	@GetMapping("/linepay")
	public String checkOrderAndChangePay(@RequestParam("transactionId") String transactionId, HttpSession session) {

		Integer saleId = (Integer) session.getAttribute("orderId");
		sService.updateLinepayIdAndPay(transactionId, saleId);
		return "shoppingcarts/checkout";
	}
}
