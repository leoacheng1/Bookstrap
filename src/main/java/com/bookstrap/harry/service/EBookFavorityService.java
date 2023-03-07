package com.bookstrap.harry.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.EBookFavorityRepository;

@Service
@Transactional
public class EBookFavorityService {

	@Autowired
	private EBookFavorityRepository ebfDao;

	
	
	public void insertEbookFavority(EBookFavorite ebf) {

		Optional<EBookFavorite> op = ebfDao.findByMemberAndEBook(ebf.getMember(), ebf.geteBook());
		
		if(!op.isPresent()) {
			EBookFavorite eBookFavorite = new EBookFavorite();
			eBookFavorite.setMember(ebf.getMember());
			eBookFavorite.seteBook(ebf.geteBook());
			ebfDao.save(eBookFavorite);
		}
		
	}
	
	
//	public boolean deleteEbookFavority(Integer ebfId) {
//		
//		if(ebfId != null) {
//			ebfDao.deleteById(ebfId);
//			return true;
//		}
//			return false;
//				
//	}
	
	public void deleteEBookFavorite(Members member, EBooks eBook) {
		ebfDao.deleteByMemberAndEBook(member.getMemberId(), eBook.geteBookId());
	}
	
	
	public EBookFavorite findEBookFavorityById(Integer ebfId) {
		Optional<EBookFavorite> op = ebfDao.findById(ebfId);
	
		if(op.isPresent()) {
			return op.get();
		}
		System.out.println("EBookFavority ID not found!");
		return null;
	}
	
	
	public List<EBookFavorite> findAllEBookFavority(){
		return ebfDao.findAll();
	}

	public List<EBookFavorite> getBookFavoriteByMember(Members member){
		return ebfDao.findByMember(member);
	}
	
}
