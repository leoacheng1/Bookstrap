package com.bookstrap.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	  
	  
	  @ResponseBody
	  @PostMapping("/semps/insert")
	  public String addShopEmployee(
//			  @RequestParam("empId")Integer empId,
			  @RequestParam("empShopid") Integer empShopid,
			  @RequestParam("empName") String empName,
			  @RequestParam("empPhoto") MultipartFile empPhoto,
			  @RequestParam("empSalary") Integer empSalary,
			  @RequestParam("SempTitle") String empTitle, RedirectAttributes redirectAttributes) {
		  try {
		   ShopEmployees se = new ShopEmployees();
//		   se.setEmpId(empId);
		   se.setEmpShopid(empShopid);
		   se.setEmpName(empName);
		   se.setEmpPhoto(empPhoto.getBytes());
		   se.setEmpSalary(empSalary);
		   se.setEmpTitle(empTitle);
		   sempService.insertShopEmployee(se);
		   
		   return "redirect:/";
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "請重新上傳");
			return "redirect:/shopemployees/home"; // 到原本那頁
		}
		   
	  }
	}


