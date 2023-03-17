package com.bookstrap.harry.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.MemberDetailRepository;


@Service
@Transactional
public class MemberDdetailService {
	
	@Autowired
	private MemberDetailRepository memberDetailDao;

	public List<MemberDetails> findAllMemberDetails(){
		return memberDetailDao.findAll();
	}
	
	public MemberDetails findMemberDetailsById(Integer memberlId) {
		Optional<MemberDetails> findById = memberDetailDao.findById(memberlId);
		
		if(findById.isPresent()) {
		return findById.get();	
		}
		System.out.println("ID not found!");
		return null;	
				}
	
	public boolean deleteMemberDetailByID(Integer memberId) {
		
		if(memberId != null){
		memberDetailDao.deleteById(memberId);
		return true;
		}
		return false;
	}

	public MemberDetails insertMemberDetails(MemberDetails memberDatil) {
		return memberDetailDao.save(memberDatil);
	}
	
	public MemberDetails updateMemberDetails(Integer memberId, 
			String memberLastName, String memberFirstName, Integer memberSex, String memberEmail, 
			String memberCellPhone, String memberAddress, Date memberbirthday) {
		Optional<MemberDetails> op = memberDetailDao.findById(memberId);
	
		if(op.isPresent()) {
				MemberDetails memberDetail = op.get();
				memberDetail.setMemberAddress(memberAddress);
				memberDetail.setMemberBirthday(memberbirthday);
				memberDetail.setMemberEmail(memberEmail);
				memberDetail.setMemberLastName(memberLastName);
				memberDetail.setMemberFirstName(memberFirstName);
				memberDetail.setMemberPhone(memberCellPhone);
				memberDetail.setMemberSex(memberSex);
				return memberDetail;
		}
		return null;
	}
	
		public MemberDetails useIdFindName(Integer memberId) {
			
			return memberDetailDao.useIdFindName(memberId);
		}
		
		public MemberDetails getPhotoById(Integer memberid) {
			Optional<MemberDetails> op = memberDetailDao.findById(memberid);
			
			
			if(op.isPresent()) {
				
				return op.get();
			}
			
			return null;
		}
		
		public Page<MemberDetails> getMemberByPage(Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberId");
				Page<MemberDetails> page = memberDetailDao.findAll(pgb);
				return page;
		}
		
		public Page<MemberDetails> findMemberLastNameLike(String memberLastName,  Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberLastName");
			Page<MemberDetails> page = memberDetailDao.findMemberLastNameLike(memberLastName, pgb);
			return page;
		}
		
		public Page<MemberDetails> findMemberFirstNameLike(String memberFirstName,  Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberLastName");
			Page<MemberDetails> page = memberDetailDao.findMemberFirstNameLike(memberFirstName, pgb);
			return page;
		}
		
		public Page<MemberDetails> findMemberGenderLike(String memberGender,  Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberLastName");
			Page<MemberDetails> page = memberDetailDao.findMemberGenderLike(memberGender, pgb);
			return page;
		}
		
		public Page<MemberDetails> findMemberAddressLike(String memberAddress,  Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberLastName");
			Page<MemberDetails> page = memberDetailDao.findMemberAddressLike(memberAddress, pgb);
			return page;
		}
		
	}
	
	

