package com.bookstrap.service;

import java.util.Optional;

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
	
	public ShoppingCarts insertBooks(ShoppingCarts cart) {
		return scDao.save(cart);
	}
	public boolean deleteBooksByMemberId(Integer memberId) {
		  if(memberId != null) {
			  scDao.deleteById(memberId);
			  return true;
		  } 
		  return false;
	}
	
	public ShoppingCarts findBooksByMemberId(Integer memberId) {
		Optional<ShoppingCarts> optional = scDao.findById(memberId);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
}
