package com.bookstrap.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.model.bean.ShopEmployeesAttendance;
import com.bookstrap.service.ShopEmployeesAttendanceService;

@Controller
public class ShopEmployeesAttendanceController {

    @Autowired
    private ShopEmployeesAttendanceService sempattService;
    
    @GetMapping("/sempsatt/insertpage")
	public String insertPage() {
		return "shopemployees/insertsempsatt";
	}


    @PostMapping("sempsatt/insert")
    public String addShopEmployeesAttendance(
    		@RequestParam("attSempid") Integer attSempid, 
    		@RequestParam("attDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date attDate,
			@RequestParam("attVacation") String attVacation, 
			@RequestParam("attTime") Double attTime,
			@RequestParam("attAgree") String attAgree) {
    	
    	try {
			ShopEmployeesAttendance sempAtt = new ShopEmployeesAttendance();
			sempAtt.setAttSempid(attSempid);
			sempAtt.setAttDate(attDate);
			sempAtt.setAttVacation(attVacation);
			sempAtt.setAttTime(attTime);
			sempAtt.setAttAgree(attAgree);
			sempattService.addShopEmployeesAttendance(sempAtt);
			return "shopemployees/home";
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "shopemployees/insertsempsatt";
    }

//    @GetMapping("")
//    public List<ShopEmployeesAttendance> getAllShopEmployeesAttendance() {
//    	return sempattService.getAllShopEmployeesAttendance();
//    }
//    
//    @GetMapping("/{attId}")
//    public ShopEmployeesAttendance getShopEmployeesAttendanceById(@PathVariable Integer attId) {
//    	return sempattService.getShopEmployeesAttendanceById(attId);
//    }
//    @PutMapping("/{attId}")
//    public void updateShopEmployeesAttendance(@RequestBody ShopEmployeesAttendance shopEmployeesAttendance, @PathVariable Integer attId) {
//        shopEmployeesAttendance.setAttId(attId);
//        sempattService.updateShopEmployeesAttendance(shopEmployeesAttendance);
//    }
//
//    @DeleteMapping("/{attId}")
//    public void deleteShopEmployeesAttendance(@PathVariable Integer attId) {
//    	sempattService.deleteShopEmployeesAttendance(attId);
//    }

}
