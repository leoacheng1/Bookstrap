package com.bookstrap.harry.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.AuthenticationProvider;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.security.CipherUtils;

@Transactional
@Service
public class UserService {

	@Autowired
	private UserRepository uDao;
	
	
	public void processOAuthPostLogin(String userEmail) {
		System.out.println("Email2: " + userEmail);
		
		Members memberAccount = uDao.getMemberAccountByUserEmail(userEmail);
		String encryptPassword = CipherUtils.getStringSHA512(userEmail);
		
		if(memberAccount == null) {
			Members newMember = new Members();
			newMember.setMemberAccount(userEmail);
			newMember.setMemberValid(1);  
			newMember.setMemberLevel(1);
			
			
			newMember.setMemberPassword(encryptPassword);
			newMember.setAuthProvider(AuthenticationProvider.GOOGLE);
			uDao.save(newMember);
		}
		
	}
	
	public Members findPasswordByEmail(String userEmail) {
		Members member = uDao.getMemberAccountByUserEmail(userEmail);
		
		member.getMemberAccount();
		member.getMemberPassword();
		uDao.save(member);
		return member;
		
	}
	
}
