package com.bookstrap.service;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.BookDetails;
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
	
	public void deleteById(Integer id) {
		bDao.deleteById(id);
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
	
	public Books getDetailIdByBookId(Integer id) {
		Optional<Books> optional = bDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Books uploadById(Integer id,String name,String author,String translator,String publisher,
			                 Date date,String languages,String category,Integer discount,
			                 Integer price,MultipartFile photo) throws IOException {
		Optional<Books> optional = bDao.findById(id);
		
		if(optional.isPresent()) {
			Books book = optional.get();
			book.setName(name);
			book.setAuthor(author);
			book.setTranslator(translator);
			book.setPublisher(publisher);
			book.setDate(date);
			book.setLanguages(languages);
			book.setCategory(category);
			book.setDiscount(discount);
			book.setPrice(price);
            book.setPhoto(photo.getBytes());
			return book;
		}
		System.out.println("沒有這筆資料");
		return null;
	}
}
