package com.bookstrap.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.BookDetailsRepository;
import com.bookstrap.model.Books;
import com.bookstrap.model.BooksRepository;

@Service
@Transactional
public class BooksService {

	@Autowired
	private BooksRepository bDao;
	
	private BookDetailsRepository dDao;

	public void insert(Books book) {
		bDao.save(book);
	}

	public void deleteById(Integer id) {
		bDao.deleteById(id);
	}

	public List<Books> findAllBooks() {
		return bDao.findAll();
	}

	public Page<Books> getBookByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "id");

		Page<Books> page = bDao.findAll(pgb);
		return page;

	}

	public Books getBookById(Integer id) {
		Optional<Books> optional = bDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public Books getDetailIdByBookId(Integer id) {
		Optional<Books> optional = bDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public Books uploadById(Integer id, String name, String author, String translator, String publisher, Date date,
			String languages, String category, Integer discount, Integer price, byte[] photo) {
		
		System.out.println(photo);
		Optional<Books> optional = bDao.findById(id);

		if (optional.isPresent()) {
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
            book.setPhoto(photo);
			System.out.println("有這筆資料");
			return book;
		}
		System.out.println("沒有這筆資料");
		return null;
	}
	
	public List<Books> findBookLikeSelector(String name) {
        return bDao.findBookLikeSelector(name);
	}
	
	public List<Books> findBookBySelector(String languages) {
        return bDao.findBookBySelector(languages);
	}
	
	public List<Books> getBookBySelector(String languages,String category){
		System.out.println(languages);
		System.out.println(category);
		return bDao.getBookBySelector(languages, category);
	}
}
