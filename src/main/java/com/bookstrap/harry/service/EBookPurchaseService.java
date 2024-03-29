package com.bookstrap.harry.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.EBookPurchases;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.EBookPurchaseRepository;

import net.bytebuddy.asm.Advice.OffsetMapping.Sort;

@Service
@Transactional
public class EBookPurchaseService {

	@Autowired
	private EBookPurchaseRepository ebpDao;
	
	public EBookPurchases insertEBookPurchase(EBookPurchases ebp) {
			return ebpDao.save(ebp); 	
	}
	
	public EBookPurchases findPurchaseByMemberAndEBook(Integer memberId, Integer eBookId) {
		return ebpDao.findPurchaseByMemberAndEBook(memberId, eBookId);
	}
	
	public EBookPurchases findById(Integer id) {
		Optional<EBookPurchases> op = ebpDao.findById(id);
		if(op.isPresent()) {
			return op.get();
			
		}
		
		return null;
	}
	
	public Page<EBookPurchases> getAllEBookPurchaseByMember(Integer pageNumber, Integer memberId){
					PageRequest pgb = PageRequest.of(pageNumber-1, 3, org.springframework.data.domain.Sort.Direction.DESC, "eBookPurchaseId");
					Page<EBookPurchases> page = ebpDao.getAllEBookPurchaseByMember(pgb, memberId);
					return page;
	}
}
