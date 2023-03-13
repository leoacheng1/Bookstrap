package com.bookstrap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.Shops;
import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.service.ShopEmployeesService;
import com.bookstrap.service.ShopsService;

@Controller
public class ShopEmployeesController {

	@Autowired
	private ShopEmployeesService sempService;
	
	@Autowired
	private ShopsService sService;

	@GetMapping("/semps/home")
	public String uploadPage() {
		return "shopemployees/home";
	}

	@GetMapping("/semps/insertpage")
	public String insertPage() {
		return "shopemployees/insertemployees2";
	}


	@PostMapping("/semps/insertemployee")
	public String addShopEmployee(@RequestParam("empShopid") Integer empShopid, @RequestParam("empName") String empName,
			@RequestParam("empPhoto") MultipartFile empPhoto, @RequestParam("empSalary") Integer empSalary,
			@RequestParam("empTitle") String empTitle) {
		try {
			ShopEmployees se = new ShopEmployees();
			se.setEmpShopid(empShopid);
			se.setEmpName(empName);
			se.setEmpPhoto(empPhoto.getBytes());
			se.setEmpSalary(empSalary);
			se.setEmpTitle(empTitle);
			sempService.addShopEmployee(se);
//			return "shopemployees/home";
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/semps/all"; // 到原本那頁
	}

	@GetMapping("/semps/all")
	public ModelAndView showShopEmployees(ModelAndView mav) {
		List<ShopEmployees> empList = sempService.getAllShopEmployees();
		mav.setViewName("shopemployees/showemployees");
		mav.getModel().put("empList", empList);
		return mav;
	}

	@GetMapping("/sempsphoto/id")
	public ResponseEntity<byte[]> getPhotoById(@RequestParam Integer id) {
		ShopEmployees photo1 = sempService.getShopEmployeeById(id);

		byte[] photofile = photo1.getEmpPhoto();
		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.IMAGE_JPEG);
		// ResponseEntity 內建 @ResponseBody // 資料, headers, 回應的 http status
		return new ResponseEntity<byte[]>(photofile, headers, HttpStatus.OK);

	}

	@GetMapping("/semps/upload")
	public String uploadShopEmployeesPage(@RequestParam("id") Integer id, Model model) {
		List<Shops> s0 = sService.findAllShop();
		ShopEmployees s1 = sempService.getShopEmployeeById(id);
		model.addAttribute("shopemployees", s1);
		model.addAttribute("shopid",s0);
		return "shopemployees/uploademployees";
	}

	@PutMapping("/semps/upload")
	public String sendUploadShopEmployees(@RequestParam("empId") Integer empId,
			@RequestParam("shop.id") Integer empShopid, @RequestParam("empName") String empName,
			@RequestParam("empPhoto") MultipartFile empPhoto, @RequestParam("empSalary") Integer empSalary,
			@RequestParam("empTitle") String empTitle) {
		try {
			ShopEmployees se = new ShopEmployees();
			se.setEmpId(empId);
			se.setEmpShopid(empShopid);
			se.setEmpName(empName);
			se.setEmpPhoto(empPhoto.getBytes());
			se.setEmpSalary(empSalary);
			se.setEmpTitle(empTitle);
			sempService.updateShopEmployee(se);
		} catch (IOException e) {
			e.printStackTrace();
//			return "redirect:/semps/home";
		}
		return "redirect:/semps/all";

	}

	@DeleteMapping("semps/delete")
	public String deleteShopEmployeeById(@RequestParam("id") Integer id) {
		sempService.deleteShopEmployee(id);
		return "redirect:/semps/all";
	}
}
