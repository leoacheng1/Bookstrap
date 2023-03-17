package com.bookstrap.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.ShopEmployeesAttendanceRepository;
import com.bookstrap.model.ShopEmployeesRepository;
import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.model.bean.ShopEmployeesAttendance;

@Transactional
@Service
public class ShopEmployeesAttendanceService {

	@Autowired
	private ShopEmployeesRepository sempDao;

	@Autowired
	private ShopEmployeesAttendanceRepository sempattDao;

	public List<ShopEmployeesAttendance> getAllShopEmployeesAttendance() {
		return sempattDao.findAll();
	}

	public ShopEmployeesAttendance getShopEmployeesAttendanceById(Integer attId) {
		return sempattDao.findById(attId).orElse(null);
	}

	public ShopEmployeesAttendance addShopEmployeesAttendance(ShopEmployeesAttendance shopEmployeesAttendance) {
		Integer sempattId = shopEmployeesAttendance.getAttSempid();
		ShopEmployees semps = sempDao.findById(sempattId).get();
		shopEmployeesAttendance.setAttSemps(semps);
		return sempattDao.save(shopEmployeesAttendance);
	}

	public void updateShopEmployeesAttendance(ShopEmployeesAttendance shopEmployeesAttendance) {
		Integer sempattId = shopEmployeesAttendance.getAttSempid();
		ShopEmployees semps = sempDao.findById(sempattId).get();
		shopEmployeesAttendance.setAttSemps(semps);
		sempattDao.save(shopEmployeesAttendance);
	}

	public void deleteShopEmployeesAttendance(Integer attId) {
		sempattDao.deleteById(attId);
	}
	
	public List<ShopEmployeesAttendance> selectShopEmployeesAttendanceById(Integer attSempid) {
		return sempattDao.selectShopEmployeesAttendanceByIdQuery(attSempid);
	}

	public List<Integer> findAttendanceByCriteria(LocalDate attStartDate, LocalDate attEndDate, String attVacation, Integer empId) {
        return sempattDao.findAttendanceByCriteria(attStartDate, attEndDate, attVacation, empId);
    }
	
	public void updateAttendanceAgreeById(Integer attId) {
		sempattDao.updateAttendanceAgreeById(attId);
    }
}
