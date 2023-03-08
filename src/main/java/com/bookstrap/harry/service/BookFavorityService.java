package com.bookstrap.harry.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Favorite;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.BookFavorityRepository;
import com.bookstrap.model.Books;

@Service
@Transactional
public class BookFavorityService {

	@Autowired
	private BookFavorityRepository bfDao;
	
	
	
	public void insertEbookFavority(Favorite bf) {

		Optional<Favorite> op = bfDao.findByMemberAndBook(bf.getMember(), bf.getBook());
		
		if(!op.isPresent()) {
			
			Favorite bookFavorite = new Favorite();
			bookFavorite.setMember(bf.getMember());
			bookFavorite.setBook(bf.getBook());
			bfDao.save(bookFavorite);
		}
		
	}
	
	public void deleteBookFavorite(Members member, Books book) {
		bfDao.deleteByMemberAndBook(member.getMemberId(), book.getId());
	}
	
	public Favorite findBookFavorityById(Integer bfId) {
		Optional<Favorite> op = bfDao.findById(bfId);
	
		if(op.isPresent()) {
			return op.get();
		}
		System.out.println("BookFavority ID not found!");
		return null;
	}
	
	
	public List<Favorite> findAllBookFavority(){
		return bfDao.findAll();
	}
	
	public List<Favorite> getBookFavoriteByMember(Members member){
		return bfDao.findByMember(member);
	}
	
	public Optional<Favorite> finByMemberAndBook(Members member, Books book) {
		return bfDao.findByMemberAndBook(member, book);
	}
	
}
