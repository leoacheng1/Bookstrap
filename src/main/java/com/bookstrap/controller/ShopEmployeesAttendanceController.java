package com.bookstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bookstrap.model.bean.ShopEmployeesAttendance;
import com.bookstrap.service.ShopEmployeesAttendanceService;

public class ShopEmployeesAttendanceController {

    @Autowired
    private ShopEmployeesAttendanceService sempattService;

    @GetMapping("")
    public List<ShopEmployeesAttendance> getAllShopEmployeesAttendance() {
        return sempattService.getAllShopEmployeesAttendance();
    }

    @GetMapping("/{attId}")
    public ShopEmployeesAttendance getShopEmployeesAttendanceById(@PathVariable Integer attId) {
        return sempattService.getShopEmployeesAttendanceById(attId);
    }

    @PostMapping("")
    public void addShopEmployeesAttendance(@RequestBody ShopEmployeesAttendance shopEmployeesAttendance) {
    	sempattService.addShopEmployeesAttendance(shopEmployeesAttendance);
    }

    @PutMapping("/{attId}")
    public void updateShopEmployeesAttendance(@RequestBody ShopEmployeesAttendance shopEmployeesAttendance, @PathVariable Integer attId) {
        shopEmployeesAttendance.setAttId(attId);
        sempattService.updateShopEmployeesAttendance(shopEmployeesAttendance);
    }

    @DeleteMapping("/{attId}")
    public void deleteShopEmployeesAttendance(@PathVariable Integer attId) {
    	sempattService.deleteShopEmployeesAttendance(attId);
    }

}
