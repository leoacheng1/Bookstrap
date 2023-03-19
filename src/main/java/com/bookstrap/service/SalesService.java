package com.bookstrap.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.model.SaleItemsRepository;
import com.bookstrap.model.SalesRepository;

@Service
@Transactional
public class SalesService {

	@Autowired
	private SalesRepository sDao;

	@Autowired
	private SaleItemsRepository siDao;
	
	@Autowired
	private JavaMailSender mailSender;

	public void checkout(Sales sales, List<SaleItems> saleItems) {

		// save the Sales to the database
		sDao.save(sales);

		// create SaleItems objects and save them to the database
		for (SaleItems item : saleItems) {
			item.setSale(sales);
			siDao.save(item);
		}
	}

	public void insert(Sales sales) {
		sDao.save(sales);
	}

	public void deleteById(Integer saleId) {
		sDao.deleteById(saleId);
	}
	
	public void updateLinepayIdAndPay(String transactionId, Integer saleId) {
		Optional<Sales> optional = sDao.findById(saleId);
		if (optional.isPresent()) {
			optional.get().setLinepayId(transactionId);
			optional.get().setPay("done");
		}
	}

	public List<Sales> findAllSales() {
		return sDao.findAll();

	}
	
	public List<Sales> findSalesByMemberId(Integer memberId){
		return sDao.findSalesByMemberId(memberId);
	}

	

	public Sales getSalesById(Integer saleId) {
		Optional<Sales> optional = sDao.findById(saleId);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public Page<Sales> searchBySaleId(int pageNumber) {
		PageRequest pageRequest = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "orderTime");
		return sDao.findAll(pageRequest);
	}
	public List<Sales> findSalesByMemberId(Integer memberId, Sort sort) {
		
		return sDao.findByMemberId(memberId, sort); 
	}
	
	
	
	public void sendVertificationEnail(String email) throws UnsupportedEncodingException, MessagingException {
		String subject = "您的訂單已送出";
		String senderName = "BookStrap team";
		String mailContent = "<p>"  + "您好" + "</p>";
		mailContent += "<p>您的訂單已送出，可以按此連結查詢訂單：</p>";

//			這裡用localhost充當
		String verifyURL = "http://localhost:8080/Bookstrap/member/myorder";
		mailContent += "<h3><a href=\"" + verifyURL + "\">查詢訂單</a></h3>";
		mailContent += "<p>BookStrap team</p>";

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("bookstrap157@gmail.com", senderName);
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(mailContent, true);

		mailSender.send(message);

	}
}
