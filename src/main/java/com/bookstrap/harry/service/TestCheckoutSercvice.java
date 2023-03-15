package com.bookstrap.harry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.TestCheckout;
import com.bookstrap.harry.dao.TestCheckoutRepository;

@Service
@Transactional
public class TestCheckoutSercvice {

	@Autowired
	private TestCheckoutRepository tcDao;
	
	
	public TestCheckout insertTestCheckout(TestCheckout tc) {
		return tcDao.save(tc);
	}
	
	public TestCheckout findTscById(Integer tcId) {
		
		return tcDao.findnTscById(tcId);
	}
	
}
