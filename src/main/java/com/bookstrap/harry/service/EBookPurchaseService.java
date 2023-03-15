package com.bookstrap.harry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.EBookPurchases;
import com.bookstrap.harry.dao.EBookPurchaseRepository;

@Service
@Transactional
public class EBookPurchaseService {

	@Autowired
	private EBookPurchaseRepository ebpDao;
	
	public EBookPurchases insertEBookPurchase(EBookPurchases ebp) {
			return ebpDao.save(ebp); 	
	}
	
}
