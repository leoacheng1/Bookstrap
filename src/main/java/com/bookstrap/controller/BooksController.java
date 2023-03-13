package com.bookstrap.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.BookDetails;
import com.bookstrap.model.Books;
import com.bookstrap.service.BookDetailsService;
import com.bookstrap.service.BooksService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@SessionAttributes("name")
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
	
	@GetMapping("/books/search")
	public String goSearch() {
		return "/books/search";
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

			return "redirect:/books/page";
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
	
	// 找詳細資料
	@ResponseBody
	@GetMapping("/books/alldetails")
	public BookDetails showAllDetails(Integer id) {
		BookDetails details = dService.getDetailsByID(id);
		return details;	
	}
	
	// 透過id找圖片
	@GetMapping("/books/id")
	public ResponseEntity<byte[]> getBookById(@RequestParam Integer id){
		Books book1 = bService.getBookById(id);
		byte[] photofile = book1.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.IMAGE_JPEG);
		          
		return new ResponseEntity<byte[]>(photofile,headers, HttpStatus.OK);
	} 
	
	
	@GetMapping("/books/details")
	public List<BookDetails> getDetailsById(@RequestParam Integer Id) {
        return dService.findById(Id);
		}

	@ResponseBody
	@GetMapping("/books/api/page")
	public Page<Books> allBookByPageAjax(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Books> page = bService.getBookByPage3(pageNumber);

		return page;
	}
	
	// 全部書籍頁面的分頁
	@GetMapping("/books/api/allpage")
	public String showBookByPageAjax(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

		Page<Books> page = bService.showBookByPageAjax(pageNumber);
		model.addAttribute("page", page);

		return "books/showBooks";
	}

	// 全部書籍頁面(後台)的分頁功能
	@GetMapping("/books/page")
	public String showBookByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

		Page<Books> page = bService.getBookByPage(pageNumber);
		model.addAttribute("page", page);

		return "books/showBooks";
	}
	
	// 全部書籍分頁功能
	@ResponseBody
	@GetMapping("/books/allpage")
	public Page<Books> AllBookByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Books> page = bService.ALLBookByPage(pageNumber);

		return page;
	}


	@ResponseBody
	@PostMapping("/books/ajax/post")
	public Page<Books> showLessThreeBooks(@RequestBody Books book) {

		Page<Books> page = bService.getBookByPage(1);

		return page;
	}
	

	// 模糊搜尋(商城)的分頁
	@ResponseBody
	@GetMapping("/books/ajax/like")
	public Page<Books> likeBook(Integer pageNumber,@RequestParam("name")String name,HttpSession session) {
		session.setAttribute("name", name);
        String result = (String) session.getAttribute("name");
        
		Page<Books> page = bService.getBookByPage2(pageNumber,result);

		return page;
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

	// 模糊搜尋ver.1
	@ResponseBody
	@GetMapping("/books/like")
	public List<Books> findBookLikeSelector(@RequestParam("name") String name) {
		return bService.findBookLikeSelector(name);
	}
	
	@ResponseBody
	@GetMapping("/books/selector")
	public List<Books> findBookBySelector(@RequestParam("languages") String languages) {
		System.out.println("搜索成功");
		return bService.findBookBySelector(languages);
	}
	
	// 多條件搜索
	@ResponseBody
	@GetMapping("/books/getbook")
	public List<Books> getBookBySelector(@RequestParam("languages")String languages, @RequestParam("category") String category) {
		System.out.println("controller  languages:"+languages+"category:"+category);
		List<Books> list = bService.getBookBySelector(languages, category);
		
		return list;
	}
	
	// 跳轉至單項商品頁面
	@GetMapping("/books/oneBook")
	public String goToBookPage(@RequestParam("id") Integer id,Model model) {
		Books book = bService.getBookById(id);
		BookDetails detail = dService.getDetailsByID(id);
		model.addAttribute("book",book);
		model.addAttribute("detail",detail);
		return "/books/bookPage";
	}
	
	// 模糊搜尋ver.2
	@PostMapping("/books/searchBook")
	public String goToSearchPage(@RequestParam("name") String name,Model model) {
		List<Books> list = bService.findBookLikeSelector(name);
		System.out.println("listsize:"+list.size());
		model.addAttribute("book",list);
		System.out.println("ok");
		return "/books/search";
	}

	// 模糊搜尋ver.3 + 結果分頁
	@GetMapping("/books/page3")
	public String showBookByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber
			                    ,@RequestParam("name") String name,Model model,HttpSession session) {
		session.setAttribute("name", name);
        String result = (String) session.getAttribute("name");
		Page<Books> page = bService.getBookByPage2(pageNumber,result);
		Model addAttribute = model.addAttribute("book", page);
		System.out.println(addAttribute);
		
		return "/books/search";
	}
	
	// 全部書籍分頁
	@GetMapping("/books/allpage2")
	public String AllBookByPage2(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,Model model) {

		Page<Books> list = bService.ALLBookByPage(pageNumber);
		model.addAttribute("allbook", list);
		return "/books/search";
	}
	
	// 推薦同類別的書籍
	@ResponseBody
	@GetMapping("/books/category")
	public List<Books> findBookByCategory(@RequestParam("category") String category) {
		return bService.findBookByCategory(category);
	}
	
	@ResponseBody
	@GetMapping("/books/author")
	public List<Books> findBookByAuthor(@RequestParam("author") String author) {
		return bService.findBookByAuthor(author);
	}
	
	// 新書推薦(語言分類)
//	@GetMapping("/books/date")
//	public String getBookByDate(@RequestParam("languages")String languages,Model model) {
//		List<Books> list = bService.getBookByDate(languages);
//		model.addAttribute("photoC",list);
//		return "/index/index";
//	}
	
	@ResponseBody
	@GetMapping("/books/date")
	public List<Books> getBookByDate(@RequestParam("languages")String languages) {
		return bService.getBookByDate(languages);
		
	}
}