package com.bookstrap.controller;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.bean.ShopEmployeesAttendance;
import com.bookstrap.model.bean.ShopEmployeesSchedule;
import com.bookstrap.service.ShopEmployeesAttendanceService;
import com.bookstrap.service.ShopEmployeesScheduleService;

@Controller
public class ShopEmployeesAttendanceController {

    @Autowired
    private ShopEmployeesAttendanceService sempattService;

	@Autowired
    private ShopEmployeesScheduleService sempscheService;
    
    @GetMapping("/sempsatt/insertpage")
	public String insertPage() {
		return "shopemployees/insertsempsatt";
	}


    @PostMapping("sempsatt/insert")
    public String addShopEmployeesAttendance(
    		@RequestParam("attSempid") Integer attSempid, 
    		@RequestParam("attStartDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attStartDate,
    		@RequestParam("attEndDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attEndDate,
			@RequestParam("attVacation") String attVacation, 
			@RequestParam("attReason") String attReason, 
			@RequestParam("attTime") Integer attTime,
			@RequestParam("attAgree") String attAgree) {
    	
    	try {
			ShopEmployeesAttendance sempAtt = new ShopEmployeesAttendance();
			sempAtt.setAttSempid(attSempid);
			sempAtt.setAttStartDate(attStartDate);
			sempAtt.setAttEndDate(attEndDate);
			sempAtt.setAttVacation(attVacation);
			sempAtt.setAttReason(attReason);
			sempAtt.setAttTime(attTime);
			sempAtt.setAttAgree(attAgree);
			sempattService.addShopEmployeesAttendance(sempAtt);
		
			return "shopemployees/insertsempsatt";
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "shopemployees/insertsempsatt";
    }

    @GetMapping("sempsatt/all")
    	public ModelAndView showShopEmployeesAttendance(ModelAndView mav) {
    		List<ShopEmployeesAttendance> sempsattList = sempattService.getAllShopEmployeesAttendance();
    		mav.setViewName("shopemployees/showsempsatt");
    		mav.getModel().put("sempsattList", sempsattList);
    		return mav;
    }
    
    @PutMapping("/sempsatt/upload")
	public String sendUploadShopEmployeesAttendance(
			@RequestParam("attId") Integer attId, 
			@RequestParam("attSempid") Integer attSempid, 
    		@RequestParam("attStartDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attStartDate,
    		@RequestParam("attEndDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attEndDate,
			@RequestParam("attVacation") String attVacation, 
			@RequestParam("attReason") String attReason, 
			@RequestParam("attTime") Integer attTime,
			@RequestParam("attAgree") String attAgree) {
		try {
			ShopEmployeesAttendance se = new ShopEmployeesAttendance();
			se.setAttId(attId);
			se.setAttSempid(attSempid);
			se.setAttStartDate(attStartDate);
			se.setAttEndDate(attEndDate);
			se.setAttVacation(attVacation);
			se.setAttReason(attReason);
			se.setAttTime(attTime);
			se.setAttAgree(attAgree);
			sempattService.updateShopEmployeesAttendance(se);
			
			LocalDate date = attStartDate;
			ZonedDateTime zdt = date.atStartOfDay(ZoneId.systemDefault());
			Instant instant = zdt.toInstant();
			Date date1 = Date.from(instant);
			LocalDate date3 = attEndDate;
			ZonedDateTime zdt1 = date3.atStartOfDay(ZoneId.systemDefault());
			Instant instant1 = zdt1.toInstant();
			Date date2 = Date.from(instant1);
			ShopEmployeesSchedule sempsche = new ShopEmployeesSchedule();
			
			sempsche.setScheduleStartdate(date1);
			sempsche.setScheduleEnddate(date2);
			sempsche.setScheduleVacation(attVacation);
			sempsche.setScheduleEmpid(attSempid);
			sempscheService.addShopEmployeesSchedule(sempsche);
			
			return "redirect:/sempsatt/all";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/semps/home";

	}
    
    
    @PutMapping("/sempsatt/unupload")
	public String sendUnUploadShopEmployeesAttendance(
			@RequestParam("attId") Integer attId, 
			@RequestParam("attSempid") Integer attSempid, 
    		@RequestParam("attStartDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attStartDate,
    		@RequestParam("attEndDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate attEndDate,
			@RequestParam("attVacation") String attVacation, 
			@RequestParam("attReason") String attReason, 
			@RequestParam("attTime") Integer attTime,
			@RequestParam("attAgree") String attAgree) {
		try {
			ShopEmployeesAttendance se = new ShopEmployeesAttendance();
			se.setAttId(attId);
			se.setAttSempid(attSempid);
			se.setAttStartDate(attStartDate);
			se.setAttEndDate(attEndDate);
			se.setAttVacation(attVacation);
			se.setAttReason(attReason);
			se.setAttTime(attTime);
			se.setAttAgree(attAgree);
			sempattService.updateShopEmployeesAttendance(se);
						
			return "redirect:/sempsatt/all";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "shopemployees/insertsempsatt";

	}
    
    
    @GetMapping("/sempsatt/myvacationpage")
    public String showShopEmployeesAttendanceById(@RequestParam("empId") Integer empId, Model model) {
    	List<ShopEmployeesAttendance> seatbyid = sempattService.selectShopEmployeesAttendanceById(empId);
    	model.addAttribute("seatbyid", seatbyid);
//		return "/semps/home";
		return "shopemployees/showmyvacationsempsatt";
    	
    	
    	
    }


}
