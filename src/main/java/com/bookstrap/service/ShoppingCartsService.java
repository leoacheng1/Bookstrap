package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.ShoppingCartsRepository;

@Service
@Transactional
public class ShoppingCartsService {

	@Autowired
	private ShoppingCartsRepository scDao;
	
	
	public List<ShoppingCarts> findCartsByMemberId(Integer memberId) {
		return scDao.findCartsByMemberId(memberId);
	}
	
}
