package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.bean.NewShoppingCarts;
import com.bookstrap.model.dao.NewShoppingCartsRepository;

@Service
@Transactional
public class NewShoppingCartsService {

	@Autowired
	private NewShoppingCartsRepository nscDao;
	
	public void addCartItem(Integer memberId, Integer bookId, Integer amount, Integer price) {
		NewShoppingCarts newShoppingCarts = new NewShoppingCarts();
		newShoppingCarts.setMemberId(memberId);
		newShoppingCarts.setBookId(bookId);
		newShoppingCarts.setAmount(amount);
		newShoppingCarts.setPrice(price);
		nscDao.save(newShoppingCarts);
	}
	
	public void deleteByCartId(Integer cartId) {
		nscDao.deleteByCartId(cartId);
	}
	
	public void deleteByBookIds(List<Integer> bookIds) {
		nscDao.deleteByBookIds(bookIds);
	}
	
	public List<NewShoppingCarts> findCartIdByMemberId(Integer memberId){
		return nscDao.findByMemberId(memberId);
	}
	
	public List<NewShoppingCarts> findCartByBookId(List<Integer> bookId){
		return nscDao.findByBookIds(bookId);
	}
	
	public void deleteAllByMemberId(Integer memberId) {
		nscDao.deleteAllByMemberId(memberId);
	}
	
	public void updateAmountByCartId(Integer amount, Integer cartId) {
		nscDao.updateAmountByCartId(amount, cartId);
	}

	
}
