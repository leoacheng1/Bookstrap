package com.bookstrap.service;

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
	
	public Shops insertPhoto(Shops sh) {
		return sDao.save(sh);
	}
	
}
