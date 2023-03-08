package com.bookstrap.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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

	@Autowired
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
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "id");

		Page<Books> page = bDao.findAll(pgb);
		return page;

	}
	
	public Page<Books> showBookByPageAjax(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "id");

		Page<Books> page = bDao.findAll(pgb);
		return page;

	}
	
	public Page<Books> ALLBookByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 20, Sort.Direction.DESC, "id");

		Page<Books> page = bDao.findAll(pgb);
		return page;

	}
	
//	public Page<Books> getBookByPage2(Integer pageNumber,String name) {
////		Pageable pgb = PageRequest.of(pageNumber - 1, 20, Sort.Direction.DESC, "id");
//		List<Books> list = bDao.findBookLikeSelector(name);
//		Page<Books> userPage = new PageImpl<Books>(list, PageRequest.of(pageNumber - 1, 2, Sort.Direction.DESC, "id"), list.size());
//
//		return userPage;
//
//	}
	
	public Page<Books> getBookByPage2(Integer pageNumber, String name) {
		System.out.println("pageNumber:"+pageNumber);
	    Pageable pageable = PageRequest.of(pageNumber - 1, 20, Sort.Direction.DESC, "id");
	    List<Books> list = bDao.findBookLikeSelector(name);
	    int start = (int) pageable.getOffset();
	    int end = Math.min((start + pageable.getPageSize()), list.size());
	    Page<Books> page = new PageImpl<>(list.subList(start, end), pageable, list.size());
	    return page;
	}
	
	public Page<Books> getBookByPage3(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 20, Sort.Direction.DESC, "id");

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

	public List<Books> getBookBySelector(String languages, String category) {
		System.out.println("SERVICE  languages:" + languages + "category:" + category);
		String strLL = languages;
		String strCC = category;

		String[] strL = languages.split(",\\s*"); // 使用正則表達式 ,\\s* 分割字串
		String[] strC = category.split(",\\s*"); // 使用正則表達式 ,\\s* 分割字串

		ArrayList<String> listL = new ArrayList<>(Arrays.asList(strL)); // 將字串數組轉換為List
		ArrayList<String> listC = new ArrayList<>(Arrays.asList(strC)); // 將字串數組轉換為List

		if (strCC == "") {
			bDao.getBookByLanguages(listL);
			System.out.println("Languages");
			return bDao.getBookByLanguages(listL);
		}else if (strLL =="") {
			System.out.println("Category");
			bDao.getBookByCategory(listC);
			return bDao.getBookByCategory(listC);
		}else {
			System.out.println("all");
			return bDao.getBookBySelector(listL, listC);
		}
	}
	
	public List<Books> findBookByCategory(String category) {
		return bDao.findBookByCategory(category);
	}
	
	public List<Books> findBookByAuthor(String author) {
		return bDao.findBookByAuthor(author);
	}
	
	public List<Books> getBookByDate(String languages) {
		return bDao.getBookByDate(languages);
	}
}
