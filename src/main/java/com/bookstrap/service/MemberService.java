package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.MemberRepository;
import com.bookstrap.model.Members;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberRepository mDao;
	
	
	public Members insertMember(Members member) {
		return mDao.save(member);
	}
	
	public boolean deleteMemberById(Integer memberId) {
		  if(memberId != null) {
			  mDao.deleteById(memberId);
			  return true;
		  } 
		  return false;
	}
	
	public Members findById(Integer memberId) {
		Optional<Members> op = mDao.findById(memberId);
		
		if(op.isPresent()) {
			return op.get();
		}
		System.out.println("Id not found!");
		return null;
	
	}
	
	public List<Members> findAllMember(){
		return mDao.findAll();
	}
	
}
