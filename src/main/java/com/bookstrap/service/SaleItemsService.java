package com.bookstrap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.model.SaleItemsRepository;

@Transactional
@Service
public class SaleItemsService {
	
	@Autowired
	private SaleItemsRepository siDao;
	
	public void insert(SaleItems saleItems) {
		siDao.save(saleItems);
	}
	
	@Transactional
    public void saveAll(List<SaleItems> saleItemsList) {
		siDao.saveAll(saleItemsList);
    }
}
