package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.Shops;
import com.bookstrap.model.ShopsRepository;

@Service
@Transactional
public class ShopsService {
	
	@Autowired
	private ShopsRepository sDao;
	
	public Shops insertShop(Shops sh) {
		return sDao.save(sh);
	}
	public List<Shops> findAllShop() {
		return sDao.findAll();
	}
}