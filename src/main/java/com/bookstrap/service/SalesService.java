package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.SaleItems;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.model.SaleItemsRepository;
import com.bookstrap.model.SalesRepository;

@Service
@Transactional
public class SalesService {

	@Autowired
	private SalesRepository sDao;

	@Autowired
	private SaleItemsRepository siDao;

	public void checkout(Sales sales, List<SaleItems> saleItems) {

		// save the Sales to the database
		sDao.save(sales);

		// create SaleItems objects and save them to the database
		for (SaleItems item : saleItems) {
			item.setSale(sales);
			siDao.save(item);
		}
	}

	public void insert(Sales sales) {
		sDao.save(sales);
	}

	public void deleteById(Integer saleId) {
		sDao.deleteById(saleId);
	}

	public List<Sales> findAllSales() {
		return sDao.findAll();
	}

	public Sales getSalesById(Integer saleId) {
		Optional<Sales> optional = sDao.findById(saleId);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
}
