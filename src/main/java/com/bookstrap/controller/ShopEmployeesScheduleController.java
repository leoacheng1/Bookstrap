package com.bookstrap.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.model.NewScheduleDto;
import com.bookstrap.model.ShopEmployeesDto;
import com.bookstrap.model.bean.ShopEmployeesSchedule;
import com.bookstrap.service.ShopEmployeesAttendanceService;
import com.bookstrap.service.ShopEmployeesScheduleService;
import com.bookstrap.service.ShopEmployeesService;

@Controller
public class ShopEmployeesScheduleController {

	@Autowired
	private ShopEmployeesScheduleService sempscheService;
	@Autowired
    private ShopEmployeesAttendanceService sempattService;
	@Autowired
	private ShopEmployeesService sempsService;

	@GetMapping("/sempsche/showpage")
	public String insertSchedule() {

		return "shopemployees/showsempsche";
	}

	@GetMapping("/sempsche/showsche")
	@ResponseBody
	public List<NewScheduleDto> findAll() {
		return sempscheService.getAllSchedules();
	}

	@GetMapping("/sempsche/showsemp")
	@ResponseBody
	public List<ShopEmployeesDto> get() {
		return sempsService.getAllIdNameByShopEmployees();
	}

	@ResponseBody
	@GetMapping("/sempsche/addsemp")
	public String addSchedule(@RequestParam("scheduleEmpid") Integer scheduleEmpid,
			@RequestParam("scheduleStartdate") String scheduleStartdate,
			@RequestParam("scheduleEnddate") String scheduleEnddate,
			@RequestParam("scheduleVacation") String scheduleVacation
			) {
		try {
			ShopEmployeesSchedule sempsche = new ShopEmployeesSchedule();
			Date startdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(scheduleStartdate);
			Date enddate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(scheduleEnddate);
			LocalDate startlocaldate = startdate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			System.out.println("startdate=" + startdate);
			System.out.println("enddate=" + enddate);
			System.out.println("startlocaldate=" + startlocaldate);
			if (enddate.compareTo(startdate) < 0) {
				return "截止日期不能小於起始日期";
			}
			List<ShopEmployeesSchedule> newchecksches = sempscheService.getSchedulesByScheduleempid(scheduleEmpid);
			if(newchecksches != null) {
				for( ShopEmployeesSchedule newchecksche:newchecksches) {
					LocalDate checkstartlocaldate = newchecksche.getScheduleStartdate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					String checkEmpname = sempsService.getShopEmployeeById(scheduleEmpid).getEmpName();
					String checkSchevacation = newchecksche.getScheduleVacation();
					
					if(startlocaldate.equals(checkstartlocaldate) ) {
						if(checkSchevacation == null) {
							return "員工:"+checkEmpname+"\n在"+checkstartlocaldate+"已排班";
						}
						return "員工:"+checkEmpname+"\n在"+checkstartlocaldate+"已排假\n假別:"+checkSchevacation;
					}
				}
			}
			
			if(scheduleVacation.isEmpty()) {
				sempsche.setScheduleEmpid(scheduleEmpid);
				sempsche.setScheduleStartdate(startdate);
				sempsche.setScheduleEnddate(enddate);
				sempscheService.addShopEmployeesSchedule(sempsche);
			}else if(! scheduleVacation.isEmpty()) {
				sempsche.setScheduleEmpid(scheduleEmpid);
				sempsche.setScheduleStartdate(startdate);
				sempsche.setScheduleEnddate(enddate);
				sempsche.setScheduleVacation(scheduleVacation);
				sempscheService.addShopEmployeesSchedule(sempsche);
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			return "上傳失敗";
		}
		return "更新成功";
	}

	@ResponseBody
	@GetMapping("/sempsche/deletesemp")
	public String deleteScheduleById(@RequestParam("scheduleId") Integer scheduleId) {
		Integer empId = sempscheService.getShopEmployeesScheduleById(scheduleId).getScheduleSemps().getEmpId();
		Date startdate = sempscheService.getShopEmployeesScheduleById(scheduleId).getScheduleStartdate();
		Date enddate = sempscheService.getShopEmployeesScheduleById(scheduleId).getScheduleEnddate();
		LocalDate localstartdate = startdate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate localenddate = enddate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		String vacation = sempscheService.getShopEmployeesScheduleById(scheduleId).getScheduleVacation();
		sempscheService.deleteShopEmployeesSchedule(scheduleId);
		List<Integer> doublechecks = sempattService.findAttendanceByCriteria(localstartdate, localenddate, vacation, empId);
//		if(doublechecks.isEmpty()) {
//		}
		for(Integer doublecheck:doublechecks) {
			sempattService.updateAttendanceAgreeById(doublecheck);
		}
		return "刪除成功";
	}

}
