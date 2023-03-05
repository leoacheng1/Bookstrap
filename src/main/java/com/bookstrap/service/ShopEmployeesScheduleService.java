package com.bookstrap.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstrap.model.NewScheduleDto;
import com.bookstrap.model.ShopEmployeesRepository;
import com.bookstrap.model.ShopEmployeesScheduleRepository;
import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.model.bean.ShopEmployeesSchedule;

@Service
public class ShopEmployeesScheduleService {

	
	@Autowired
	private ShopEmployeesRepository sempDao;
	
	@Autowired
	private ShopEmployeesScheduleRepository sempscheDao;
	
	
	public List<NewScheduleDto> getAllSchedules() {
        List<NewScheduleDto> scheduleDtos = new ArrayList<>();
        List<ShopEmployeesSchedule> schedules = sempscheDao.findAll();
        for (ShopEmployeesSchedule schedule : schedules) {
        	NewScheduleDto scheduleDto = new NewScheduleDto();
            scheduleDto.setScheduleId(schedule.getScheduleId());
            scheduleDto.setStartDate(schedule.getScheduleStartdate());
            scheduleDto.setEndDate(schedule.getScheduleEnddate());
            scheduleDto.setVacation(schedule.getScheduleVacation());
            scheduleDto.setScheduleEmpid(schedule.getScheduleSemps().getEmpId());
            ShopEmployees employee = sempDao.findById(schedule.getScheduleSemps().getEmpId()).orElse(null);
            if (employee != null) {
                scheduleDto.setScheduleEmpname(employee.getEmpName());
            }
            
            scheduleDtos.add(scheduleDto);
        }
        return scheduleDtos;
    }



	public ShopEmployeesSchedule getShopEmployeesScheduleById(Integer scheduleId) {
		return sempscheDao.findById(scheduleId).orElse(null);
	}

	public ShopEmployeesSchedule addShopEmployeesSchedule(ShopEmployeesSchedule ShopEmployeesSchedule) {
		Integer sempattId = ShopEmployeesSchedule.getScheduleEmpid();
		ShopEmployees semps = sempDao.findById(sempattId).get();
		ShopEmployeesSchedule.setScheduleSemps(semps);
		return sempscheDao.save(ShopEmployeesSchedule);
	}

	public void updateShopEmployeesSchedule(ShopEmployeesSchedule ShopEmployeesSchedule) {
		Integer sempattId = ShopEmployeesSchedule.getScheduleEmpid();
		ShopEmployees semps = sempDao.findById(sempattId).get();
		ShopEmployeesSchedule.setScheduleSemps(semps);
		sempscheDao.save(ShopEmployeesSchedule);
	}

	public void deleteShopEmployeesSchedule(Integer scheduleId) {
		sempscheDao.deleteById(scheduleId);
	}
	
	
}
