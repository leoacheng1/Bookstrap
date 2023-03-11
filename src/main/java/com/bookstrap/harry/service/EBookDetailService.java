package com.bookstrap.harry.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.EBookDetails;
import com.bookstrap.harry.dao.EBookDetailsRepository;

@Service
@Transactional
public class EBookDetailService {

	@Autowired
	private EBookDetailsRepository eBookDetialDao;

	public EBookDetails insertEBokDetials(EBookDetails eBookDetails) {

		return eBookDetialDao.save(eBookDetails);

	}

	public boolean deleteEBokDetialsById(Integer EbookDetailId) {

		if (EbookDetailId != null) {
			eBookDetialDao.deleteById(EbookDetailId);
			return true;
		}
		return false;
	}
	
	public List<EBookDetails> findAllEBookDetails(){
		return eBookDetialDao.findAll();
	}
	
	public EBookDetails getDetailById(Integer eBookId) {
		Optional<EBookDetails> op = eBookDetialDao.findById(eBookId);
	
		return op.get();
	}
}
