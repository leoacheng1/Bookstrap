package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.BookDetails;
import com.bookstrap.model.BookDetailsRepository;
import com.bookstrap.model.Books;

@Service
@Transactional
public class BookDetailsService {

	@Autowired
	private BookDetailsRepository dDao;
	
	public void insertBookDetail(BookDetails details) {
		dDao.save(details);
	}
	
	public List<BookDetails> getAllDetails() {
		return dDao.findAll();
	}
	
	public BookDetails getDetailsByID(Integer id) {
        Optional<BookDetails> optional = dDao.findById(id);

//		if(optional.isPresent()) {
//			return optional.get();
//		}
//		
//		return null;
		return optional.get();
	}
	
	public Page<BookDetails> getBookByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.ASC, "id");
		
		Page<BookDetails> page = dDao.findAll(pgb);
		
		return page;
		
	}
	
	public BookDetails uploadById(Integer id,String size,Integer pages,String intro,String grade) {
		Optional<BookDetails> optional = dDao.findById(id);
		
		if(optional.isPresent()) {
			BookDetails details = optional.get();
			details.setSize(size);
			details.setPages(pages);
			details.setIntro(intro);
			details.setGrade(grade);
			return details;
		}
		System.out.println("沒有這筆資料");
		return null;
	}

	public List<BookDetails> findById(Integer id) {
		dDao.findById(id);
		return null;
	}
}
