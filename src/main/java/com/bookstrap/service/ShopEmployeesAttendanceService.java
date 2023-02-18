package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstrap.model.ShopEmployeesAttendanceRepository;
import com.bookstrap.model.bean.ShopEmployeesAttendance;

@Service
public class ShopEmployeesAttendanceService {

    @Autowired
    private ShopEmployeesAttendanceRepository sempattDao;

    public List<ShopEmployeesAttendance> getAllShopEmployeesAttendance() {
        return sempattDao.findAll();
    }

    public ShopEmployeesAttendance getShopEmployeesAttendanceById(Integer attId) {
        return sempattDao.findById(attId).orElse(null);
    }

    public void addShopEmployeesAttendance(ShopEmployeesAttendance shopEmployeesAttendance) {
    	sempattDao.save(shopEmployeesAttendance);
    }

    public void updateShopEmployeesAttendance(ShopEmployeesAttendance shopEmployeesAttendance) {
    	sempattDao.save(shopEmployeesAttendance);
    }

    public void deleteShopEmployeesAttendance(Integer attId) {
    	sempattDao.deleteById(attId);
    }

}
