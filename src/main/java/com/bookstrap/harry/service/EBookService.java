package com.bookstrap.harry.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Sort;

import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.dao.EBookRepository;


@Service
@Transactional
public class EBookService {

	@Autowired
	private EBookRepository eBookDao;
	
	
	
	
	public EBooks insertEBook(EBooks eBook) {
		return eBookDao.save(eBook);
	}
	
	
	public boolean deleteEBookById(Integer eBookId) {
		if(eBookId != null) {
			eBookDao.deleteById(eBookId);
			return true;
		}
		return false;
	}

//	public EBooks updateEBookById(Integer eBookId, EBooks eBook) {
//			Optional<EBooks> op = eBookDao.findById(eBookId);
//			
//			if(op.isPresent()) {
//				EBooks eBooks = op.get();
//				eBooks.seteBookName(eBook.geteBookName());
//				eBooks.seteBookcategory(eBook.geteBookcategory());
//				eBooks.seteBooklanguages(eBook.geteBooklanguages());
//				eBooks.seteBookauthor(eBook.geteBookauthor());
//				eBooks.seteBookpublisher(eBook.geteBookpublisher());
//				eBooks.seteBookPublishDate(eBook.geteBookPublishDate());
//				eBooks.seteBookdiscount(eBook.geteBookdiscount());
//				eBooks.seteBookprice(eBook.geteBookprice());
//				eBooks.seteBooktranslator(eBook.geteBooktranslator());
//				eBooks.seteBookFile(eBook.geteBookFile());
//				
//				
//				eBooks.seteBookphoto(eBook.geteBookphoto());
//				
//				
//				
//				
//				
//			}
//			
//	}
	
	public List<EBooks> findAllEbooks(){
		
		return eBookDao.findAll();
	}
	
	public Page<EBooks> getEBooksByPage(Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "EBookId");
			Page<EBooks> page = eBookDao.findAll(pgb);
			return page;
	}
	
	public EBooks getPhotoById(Integer eBookId) {
		Optional<EBooks> op = eBookDao.findById(eBookId);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	
	}
}
