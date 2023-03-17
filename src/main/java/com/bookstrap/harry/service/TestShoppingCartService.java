package com.bookstrap.harry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.TestShoppingCatrs;
import com.bookstrap.harry.dao.TestShoppingCartRepository;

@Service
@Transactional
public class TestShoppingCartService {

	@Autowired
	private TestShoppingCartRepository tscDao;
	
	public TestShoppingCatrs insertTestShoppingCart(TestShoppingCatrs tsc) {
		return tscDao.save(tsc);
	}
	
	
	
}
