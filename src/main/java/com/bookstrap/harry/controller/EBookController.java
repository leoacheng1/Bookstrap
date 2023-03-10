package com.bookstrap.harry.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.harry.bean.EBookDetails;
import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.EBookDetailService;
import com.bookstrap.harry.service.EBookFavorityService;
import com.bookstrap.harry.service.EBookService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class EBookController {

	@Autowired
	private EBookService eBookService;
	
	@Autowired
	private EBookDetailService eBookDetailService;
	
	@Autowired
	private EBookFavorityService ebfService;
	
	@Autowired
	private MemberService mService;
	
//	@ModelAttribute
//	public void mainController(Model m) {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("response", "N");
//		m.addAttribute("default", map);
//		return;
//	}
	
//	@GetMapping("/ebook/index")
//	public String toEBookIndex() {
//		return "member/EBooks/EBookIndex";
//	}
	
//	@GetMapping("/ebook/addpage")
//	public String addEBookPage() {
//		return "";
//	}
	
	@GetMapping("/ebook/get/allebook")
	public String findAllEbooks(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			Model m, HttpSession session){
		Page<EBooks> page = eBookService.getEBooksByPage(pageNumber);
		m.addAttribute("page", page);
		LinkedHashMap<Integer, Boolean> favorite = new LinkedHashMap<Integer,Boolean>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		if (memberId == null) return "member/EBooks/EBookIndex";
		
		Members member = mService.findById(memberId);

		List<EBooks> ebooks = page.getContent();
		for (EBooks ebook : ebooks) {
			Optional<EBookFavorite> optional = ebfService.finByMemberAndEBook(member, ebook);			
			favorite.put(ebook.geteBookId(), optional.isPresent() ? true : false);
		}
		m.addAttribute("favorite",favorite);
		
//		return "books/search";
		return "member/EBooks/EBookIndex";
//		return "member/EBooks/NewEBookIndex";
	}
	
	@GetMapping("/ebook/get/epub")
	public String toEPUBpage(@RequestParam("eBookId") Integer eBookId, Model m) {
		m.addAttribute("eBookId", eBookId);
		return"member/ePub/Viewer2";
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
			@RequestParam("eBookGrade") String eBookGrade,
			@RequestParam("eBookNumber") Integer eBookNumber
	) throws IOException {
		
		byte[] photoBytes = eBookPhoto.getBytes();
		byte[] fileBytes = eBookFile.getBytes();
		
	
		
		EBooks eBook = new EBooks();
//		eBook.seteBookId(eBookDetailId.geteBookDetailId());
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
		eBook.seteBookNumber(eBookNumber);
		
		EBooks newEbook = eBookService.insertEBook(eBook);
		
		EBookDetails eBookDetail = new EBookDetails();
		eBookDetail.seteBook(newEbook);
		eBookDetail.seteBooksize(eBookSize);
		eBookDetail.seteBookpages(eBookpage);
		eBookDetail.seteBookintro(eBookIntro);
		eBookDetail.seteBookgrade(eBookGrade);
		
		EBookDetails eBookDetailId = eBookDetailService.insertEBokDetials(eBookDetail);	
		
//		return null;
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
	
	@GetMapping("/eBook/get/pdfpage")
	public String toPDFpage(@RequestParam("eBookId") Integer eBookId, Model m) {
			
		m.addAttribute("eBookId", eBookId);
		
		return "member/EBooks/EBookShowPDF";
	}
	
	@GetMapping("/ebook/get/pdf")
	public ResponseEntity<byte[]> getPDF(@RequestParam("eBookId") Integer eBookId){
		EBooks fildId = eBookService.getEBookFileById(eBookId);
		
		System.out.println("eBookId =" + eBookId);
		
		byte[] pdfFile = fildId.geteBookFile();
		
//		String fileName = "testPDF.pdf";
		System.out.println("PDFPPP: " + pdfFile);
//		ByteArrayResource resource = new ByteArrayResource(pdfFile);
		
		HttpHeaders header = new HttpHeaders();
//		header.setContentDispositionFormData(fileName, fileName);  //下載pdf
		header.setContentType(MediaType.APPLICATION_PDF);
		return ResponseEntity.ok()
				.headers(header)
				.contentLength(pdfFile.length)
				.contentType(MediaType.APPLICATION_PDF)
				.body(pdfFile);
		
	}
	
//	@GetMapping("/ebook/get/photo")
//	public ResponseEntity<byte[]> getEBookFigureById(@RequestParam("eBookId") Integer eBookId){
//		 EBooks eBookId1 = eBookService.getPhotoById(eBookId);
//		 byte[] eBookPhoto = eBookId1.geteBookPhoto();
//		 HttpHeaders headers = new HttpHeaders();
//			
//			headers.setContentType(MediaType.IMAGE_JPEG);
//				return new ResponseEntity<byte[]>(eBookPhoto, headers, HttpStatus.OK);
//	}
	
	
}