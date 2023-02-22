package com.bookstrap.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.BookDetails;
import com.bookstrap.model.Books;
import com.bookstrap.service.BookDetailsService;
import com.bookstrap.service.BooksService;

@Controller
public class BooksController {

	@Autowired
	private BooksService bService;

	@Autowired
	private BookDetailsService dService;

	// 跳轉至首頁
	@GetMapping("/")
	public String goToIndex() {
		return "/books/testIndex";
	}

	// 跳轉至新增頁面
	@GetMapping("/books/add")
	public String addBook(Model model) {
		Books newBook = new Books();
		model.addAttribute("books", newBook);
		return "books/addBooks";
	}

	// insert 功能
	@PostMapping("/books/post")
	public String addBook(@RequestParam("name") String name, @RequestParam("author") String author,
			@RequestParam("translator") String translator, @RequestParam("publisher") String publisher,
			@RequestParam("date") Date date, @RequestParam("languages") String languages,
			@RequestParam("category") String category, @RequestParam("discount") Integer discount,
			@RequestParam("price") Integer price, @RequestParam("size") String size,
			@RequestParam("pages") Integer pages, @RequestParam("intro") String intro,
			@RequestParam("grade") String grade, @RequestParam("photo") MultipartFile photo) {

		try {
			Books newBook = new Books();
			newBook.setName(name);
			newBook.setAuthor(author);
			newBook.setTranslator(translator);
			newBook.setPublisher(publisher);
			newBook.setDate(date);
			newBook.setLanguages(languages);
			newBook.setCategory(category);
			newBook.setDiscount(discount);
			newBook.setPrice(price);
			newBook.setPhoto(photo.getBytes());

			ArrayList<BookDetails> list = new ArrayList<>();

			BookDetails details = new BookDetails();
			details.setSize(size);
			details.setPages(pages);
			details.setIntro(intro);
			details.setGrade(grade);
			details.setBooks(newBook);

			list.add(details);

			newBook.setBookDetails(details);

			bService.insert(newBook);

			return "/books/testIndex";
		} catch (IOException e) {
			e.printStackTrace();
			return "/books/addBooks";
		}
	}

	// delete 功能 -> 跳至所有書籍頁面
	@DeleteMapping("/books/delete")
	public String deteleBookApi(@RequestParam("id") Integer id) {
		bService.deleteById(id);
		return "redirect:/books/page";
	}

	// 找全部資料
	@GetMapping("/books/all")
	public ModelAndView showBook(ModelAndView mav) {
		List<Books> list = bService.findAllBooks();
		mav.setViewName("books/showBooks");
		mav.getModel().put("list", list);
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/books/alldetails")
	public BookDetails showAllDetails(Integer id) {
//		BookDetails detail = 	
		BookDetails dService2 = dService.getDetailsByID(id);
//	
//		List<BookDetails> list = new ArrayList<>();
//		List<Stirng> dList = new ArrayList<>();
//		list.add(dService2);
//		for (BookDetails books:list) {
//			System.out.println(books.getSize());
//			System.out.println(books.getIntro());
//			System.out.println(books.getGrade());
//			System.out.println(books.getPages());
//			String size=books.getSize();
//			String intro=books.getIntro();
//			String grade=books.getGrade();
//			String pages=books.getPages().toString();
//			
//			dList.add(size);
//			dList.add(intro);
//			dList.add(grade);
//			dList.add(pages);
//		}
		return	dService2;
//		String size = detail.getSize();
//		System.out.println(size);
//		List<BookDetails> list = new ArrayList<>();
//		list.add(detail);
//		
		
	}

	@ResponseBody
	@GetMapping("/books/api/page")
	public Page<Books> showBookByPageAjax(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Books> page = bService.getBookByPage(pageNumber);

		return page;
	}

	@ResponseBody
	@GetMapping("/books/api/page2")
	public List<Books> showBookByPageAjax2(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<BookDetails> page1 = dService.getBookByPage(1);
		List<BookDetails> page11 = page1.getContent();

		Page<Books> page2 = bService.getBookByPage(1);
		List<Books> page22 = page2.getContent();

		return page22;
	}

	// 分頁功能
	@GetMapping("/books/page")
	public String showBookByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

		Page<Books> page = bService.getBookByPage(pageNumber);
		model.addAttribute("page", page);

		return "books/showBooks";
	}

	@ResponseBody
	@PostMapping("/books/ajax/post")
	public Page<Books> showLessThreeBooks(@RequestBody Books book) {

		Page<Books> page = bService.getBookByPage(1);

		return page;
	}

	// 透過id找圖片
	@GetMapping("/books/id")
	public ResponseEntity<byte[]> getBookById(@RequestParam Integer id) {
		Books book1 = bService.getBookById(id);

		byte[] photofile = book1.getPhoto();

		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photofile, headers, HttpStatus.OK);
	}


	// 跳轉至修改書籍頁面
	@GetMapping("/books/edit")
	public String editBookPage(@RequestParam("id") Integer id, Model model) {
		Books book = bService.getBookById(id);
		BookDetails detail = dService.getDetailsByID(id);
		model.addAttribute("book", book);
		model.addAttribute("detail", detail);
		return "/books/editBooks";
	}
	
    // update
	@ResponseBody
	@PutMapping("/books/update")
	public String updateBookById(@RequestParam("id") Integer id, @RequestParam("name") String name,
			@RequestParam("author") String author, @RequestParam("translator") String translator,
			@RequestParam("publisher") String publisher, @RequestParam("date") Date date,
			@RequestParam("languages") String languages, @RequestParam("category") String category,
			@RequestParam("discount") Integer discount, @RequestParam("price") Integer price,
			@RequestParam("size") String size, @RequestParam("pages") Integer pages,
			@RequestParam("intro") String intro, @RequestParam("grade") String grade,
			@RequestParam("photo") MultipartFile photo) {

		try {
			byte[] photoBytes = photo.getBytes();
			Books book = bService.uploadById(id, name, author, translator, publisher, date, languages, category,
					discount, price, photoBytes);
			BookDetails detail = dService.uploadById(id, size, pages, intro, grade);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}