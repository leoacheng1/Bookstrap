package com.bookstrap.harry.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.MemberDetails;
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
	
	public void deleteMemberDetailByID(Integer memberId) {
		 memberDetailDao.deleteById(memberId);
	}

	public MemberDetails insertMemberDetails(MemberDetails memberDatil) {
		return memberDetailDao.save(memberDatil);
	}
	
	public MemberDetails updateMemberDetails(Integer memberId, String memberName, Integer memberSex, String memberEmail, String memberCellPhone, String memberAddress, Date memberbirthday) {
		Optional<MemberDetails> op = memberDetailDao.findById(memberId);
	
		if(op.isPresent()) {
				MemberDetails memberDetail = op.get();
				memberDetail.setMemberAddress(memberAddress);
				memberDetail.setMemberBirthday(memberbirthday);
				memberDetail.setMemberEmail(memberEmail);
				memberDetail.setMemberName(memberName);
				memberDetail.setMemberPhone(memberName);
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
		
		
	}
	
	

