package com.bookstrap.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.ShoppingCartsRepository;
import com.bookstrap.model.pk.ShoppingCartsPK;

@Service
@Transactional
public class ShoppingCartsService {

	@Autowired
	private ShoppingCartsRepository scDao;
	
	public ShoppingCarts insertBooks(ShoppingCarts cart) {
		return scDao.save(cart);
	}
	public boolean deleteBooksByMemberId(ShoppingCartsPK memberId) {
		  if(memberId != null) {
			  scDao.deleteById(memberId);
			  return true;
		  } 
		  return false;
	}
	
	
	public ShoppingCarts findOrdersByMemberId(ShoppingCartsPK memberId) {
		Optional<ShoppingCarts> optional = scDao.findById(memberId);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	
}
