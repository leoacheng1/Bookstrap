package com.bookstrap.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstrap.model.Books;
import com.bookstrap.service.BooksService;

@Controller
public class BooksController {

	@Autowired
	private BooksService bService;
	
	@GetMapping("/")
	public String goToIndex() {
		return "/books/testIndex";
	}

	@GetMapping("/books/add")
	public String addBook(Model model) {
		Books newBook = new Books();
		model.addAttribute("books", newBook);
		return "books/addBooks";
	}
	
	@PostMapping("/books/post")
	public String addBook(@RequestParam("name") String name,
			@RequestParam("author") String author,
			@RequestParam("translator") String translator,
			@RequestParam("publisher") String publisher,
			@RequestParam("date") Date date,
			@RequestParam("languages") String languages,
			@RequestParam("category") String category,
			@RequestParam("discount") Integer discount,
			@RequestParam("price") Integer price,
			@RequestParam("photo") MultipartFile photo,
			RedirectAttributes redirectAttributes) {
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
			bService.insert(newBook);
			
			return "/books/testIndex"; 
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg","請重新新增");
			return "/books/addBooks"; 
		}

	}
	
	@GetMapping("/books/all")
	public ModelAndView showBook(ModelAndView mav) {
		List<Books> list = bService.findAllBooks();
		mav.setViewName("books/showBooks");
		mav.getModel().put("list", list);
		return mav;
	}
	
	@GetMapping("/books/id")
	public ResponseEntity<byte[]> getBookById(@RequestParam Integer id){
		Books book1 = bService.getBookById(id);
		byte[] photofile = book1.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.IMAGE_JPEG);
		          
		return new ResponseEntity<byte[]>(photofile,headers, HttpStatus.OK);
	} 
	
}
