package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.BookDetailsRepository;
import com.bookstrap.model.Books;
import com.bookstrap.model.BooksRepository;
import com.bookstrap.model.ShoppingCartsRepository;

@Service
@Transactional
public class ShoppingCartsService {

	@Autowired
	private ShoppingCartsRepository scDao;
	@Autowired
	private BooksRepository bDao;
	@Autowired
	private BookDetailsRepository bdDao;
	
	
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
	public Books findBooksByBookId(Integer bookId){
		Optional<Books> books = bDao.findById(bookId);
		if(books.isEmpty()) {
			return null;
		}
		System.out.println(books);
		return books.get();
	}
	
}
