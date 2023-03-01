package com.bookstrap.harry.controller;

import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

import com.bookstrap.harry.bean.EBookDetails;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.service.EBookDetailService;
import com.bookstrap.harry.service.EBookService;

@Controller
public class EBookController {

	@Autowired
	private EBookService eBookService;
	
	@Autowired
	private EBookDetailService eBookDetailService;
	
	
	
	@GetMapping("/ebook/index")
	public String toEBookIndex() {
		return "member/EBooks/EBookIndex";
	}
	
	@GetMapping("/ebook/addpage")
	public String addEBookPage() {
		return "";
	}
	
	@GetMapping("/ebook/get/allebook")
	public String findAllEbooks(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			Model m){
		Page<EBooks> page = eBookService.getEBooksByPage(pageNumber);
		m.addAttribute("page", page);
		return "redirect:/ebook/index";
	}
	
	@PostMapping("/ebook/post/addebook")
	public String addEBook(@RequestParam("eBookName") String eBookName,
			@RequestParam("eBookCategory") String eBookCategory,
			@RequestParam("eBookLanguages") String eBookLanguages,
			@RequestParam("eBookAuthor") String eBookAuthor,
			@RequestParam("eBookPublisher") String eBookPublisher,
			@RequestParam("eBookPublishDate") Date eBookPublishDate,
			@RequestParam("eBookPhoto") MultipartFile eBookPhoto,
			@RequestParam("eBookDiscount") Integer eBookDiscount,
			@RequestParam("eBookPrice") Integer eBookPrice,
			@RequestParam("eBookTranslator") String eBookTranslator,
			@RequestParam("eBookFile") MultipartFile eBookFile,
			@RequestParam("eBookSize") String eBookSize,
			@RequestParam("eBookPage") Integer eBookpage,
			@RequestParam("eBookIntro") String eBookIntro,
			@RequestParam("eBookGrade") String eBookGrade
	) throws IOException {
		
		byte[] photoBytes = eBookPhoto.getBytes();
		byte[] fileBytes = eBookFile.getBytes();
		
		EBookDetails eBookDetail = new EBookDetails();
		
		eBookDetail.seteBooksize(eBookSize);
		eBookDetail.seteBookpages(eBookpage);
		eBookDetail.seteBookintro(eBookIntro);
		eBookDetail.seteBookgrade(eBookGrade);
		
		EBookDetails eBookDetailId = eBookDetailService.insertEBokDetials(eBookDetail);
		
		EBooks eBook = new EBooks();
		eBook.seteBookId(eBookDetailId.geteBookDetailId());
		eBook.seteBookName(eBookName);
		eBook.seteBookCategory(eBookCategory);
		eBook.seteBookLanguages(eBookLanguages);
		eBook.seteBookAuthor(eBookAuthor);
		eBook.seteBookPublisher(eBookPublisher);
		eBook.seteBookPublishDate(eBookPublishDate);
		eBook.seteBookPhoto(photoBytes);
		eBook.seteBookDiscount(eBookDiscount);
		eBook.seteBookPrice(eBookPrice);
		eBook.seteBookTranslator(eBookTranslator);
		eBook.seteBookFile(fileBytes);
		
		eBookService.insertEBook(eBook);
		
		
		return "redirect:/ebook/get/allebook";
	}
	
	
	@GetMapping("/ebook/get/photo")
	public ResponseEntity<byte[]> getEBookPhoto(@RequestParam Integer eBookId){
		EBooks photoId = eBookService.getPhotoById(eBookId);
		byte[] photoFile = photoId.geteBookPhoto();
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(photoFile, header, HttpStatus.OK);
	}
	
}