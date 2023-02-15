package com.bookstrap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.service.ShopEmployeesService;



	@Controller
	public class ShopEmployeesController {

	  @Autowired
	  private ShopEmployeesService sempService;
	  
	  @GetMapping("/semps/home")
		public String uploadPage() {
			return "shopemployees/home";
		}
	  @GetMapping("/semps/insertpage")
		public String insertPage() {
			return "shopemployees/insertemployees";
		}
//	  @GetMapping("/semps/showpage")
//	  public String showPage() {
//		  return "shopemployees/showemployees";
//	  }
	 
	  @PostMapping("/semps/insertemployee")
	  public String addShopEmployee(
			  @RequestParam("empShopid") Integer empShopid,
			  @RequestParam("empName") String empName,
			  @RequestParam("empPhoto") MultipartFile empPhoto,
			  @RequestParam("empSalary") Integer empSalary,
			  @RequestParam("empTitle") String empTitle) {
		  try {
		   ShopEmployees se = new ShopEmployees();
		   se.setEmpShopid(empShopid);
		   se.setEmpName(empName);
		   se.setEmpPhoto(empPhoto.getBytes());
		   se.setEmpSalary(empSalary);
		   se.setEmpTitle(empTitle);
		   sempService.addShopEmployee(se);
		   return "shopemployees/home";
		} catch (IOException e) {
			e.printStackTrace();
			return "shopemployees/insertemployee"; // 到原本那頁
		}
	  }
	  
	  
	  @GetMapping("/semps/all")
	  public ModelAndView showShopEmployees(ModelAndView mav) {
		 List<ShopEmployees> empList = sempService.getAllShopEmployees();
		  mav.setViewName("shopemployees/showemployees");
		  mav.getModel().put("empList", empList);
		  return mav;
	  }
	  @GetMapping("/sempsphoto/id")
		public ResponseEntity<byte[]> getPhotoById(@RequestParam Integer id){
			ShopEmployees photo1 = sempService.getShopEmployeeById(id);
			
			
			byte[] photofile = photo1.getEmpPhoto();
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentType(MediaType.IMAGE_JPEG);
	        //ResponseEntity 內建 @ResponseBody   // 資料, headers, 回應的 http status
			return new ResponseEntity<byte[]>(photofile,headers,HttpStatus.OK);
			
		}

	}
	


