package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstrap.model.ShopEmployeesAttendanceRepository;
import com.bookstrap.model.ShopEmployeesRepository;
import com.bookstrap.model.Shops;
import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.model.bean.ShopEmployeesAttendance;

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
		sempattDao.save(shopEmployeesAttendance);
	}

	public void deleteShopEmployeesAttendance(Integer attId) {
		sempattDao.deleteById(attId);
	}

}
