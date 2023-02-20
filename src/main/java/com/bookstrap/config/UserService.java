package com.bookstrap.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.AuthenticationProvider;
import com.bookstrap.harry.bean.Members;

@Transactional
@Service
public class UserService {

	@Autowired
	private UserRepository uDao;
	
	
	public void processOAuthPostLogin(String userEmail) {
		System.out.println("Email2: " + userEmail);
		
		Members memberAccount = uDao.getMemberAccountByUserEmail(userEmail);
		
		if(memberAccount == null) {
			Members newMember = new Members();
			newMember.setMemberAccount(userEmail);
			newMember.setMemberValid(1);  //要用5代表Google?
			newMember.setMemberLevel(1);
			newMember.setMemberPassword(userEmail);
			newMember.setAuthProvider(AuthenticationProvider.GOOGLE);
			uDao.save(newMember);
		}
		
	}
	
}
