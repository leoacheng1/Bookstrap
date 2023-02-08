package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.Books;
import com.bookstrap.model.BooksRepository;

@Service
@Transactional
public class BooksService {

	@Autowired
	private BooksRepository bDao;
	
	public void insert(Books book) {
		bDao.save(book);
	}
	
	public List<Books> findAllBooks(){
		return bDao.findAll();
	}
	
	public Books getBookById(Integer id) {
		Optional<Books> optional = bDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
}
