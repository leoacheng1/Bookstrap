package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	public Shops getPhotoById(Integer id) {
		Optional<Shops> optional = sDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public void deleteshopsbById(Integer id) {
		sDao.deleteById(id);
	}
	public Page<Shops> getshopByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3,Sort.Direction.DESC, "id");
		
		Page<Shops> page = sDao.findAll(pgb);
		
		return page;
	}
}
