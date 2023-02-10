package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstrap.model.bean.ShopEmployees;
import com.bookstrap.model.bean.ShopEmployeesRepository;

@Service
public class ShopEmployeesService {

  @Autowired
  private ShopEmployeesRepository sempDao;

  public List<ShopEmployees> getAllShopEmployees() {
    return sempDao.findAll();
  }

  public ShopEmployees getShopEmployeeById(int id) {
    return sempDao.findById(id).orElse(null);
  }

  public ShopEmployees addShopEmployee(ShopEmployees shopEmployee) {
    return sempDao.save(shopEmployee);
  }

  public ShopEmployees updateShopEmployee(ShopEmployees shopEmployee) {
    return sempDao.save(shopEmployee);
  }

  public void deleteShopEmployee(int id) {
	  sempDao.deleteById(id);
  }
}

