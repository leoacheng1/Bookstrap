package com.bookstrap.service;

import java.util.List;
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
	

//	public List<ShoppingCarts> findCartsByMemberId(Integer memberId) {
//		return scDao.findCartsByMemberId(memberId);
//	}
//	
//	public void deleteCartsByBookId(Integer bookId) {
//		scDao.deleteBookById(bookId);
//	}

	// 根據會員id查詢購車清單
	public List<ShoppingCarts> findCartItemsByMemberId(Integer memberId) {
		return scDao.findByMemberId(memberId);
	}

	// 根據會員id拿取書本id的相關資料
	public ShoppingCarts updateAmountByBookId(Integer amount, Integer bookId) {
//		Optional<Books> books = bDao.findById(bookId);
//		ShoppingCarts sc = new ShoppingCarts();
//		sc.setBookId(bookId);
//		sc.setAmount(amount);
		Optional<ShoppingCarts> optional = scDao.findBookByBookId(bookId);
		if (optional.isEmpty()) {
			return null;
		}
		System.out.println(optional);
		ShoppingCarts shoppingCarts = optional.get();
		shoppingCarts.setAmount(amount);
		return shoppingCarts;
	}

	// 根據書籍id刪除對應的購物車內項目
	public void deleteBookByBookId(Integer bookId) {
		scDao.deleteBookByBookId(bookId);
	}
	
	// 根據會員id刪除所有購物車內項目
	public void deleteAllByMemberId(Integer memberId) {
		scDao.deleteAllByMemberId(memberId);
	}

	// 根據書籍id更新購物車內書籍數量
	public void updateCartItemAmount(Integer amount, Integer bookId) {
		scDao.updateCartItemAmount(amount, bookId);
    }


//	public void saveOrUpdate(Integer bookId) {
//        List<Books> book = scDao.find
//
//        if (existingItem.isPresent()) {
//            ShoppingCart cartItem = existingItem.get();
//            cartItem.setAmount(shoppingCart.getAmount());
//            shoppingCartRepository.save(cartItem);
//        } else {
//            shoppingCartRepository.save(shoppingCart);
//        }
//    }
}
