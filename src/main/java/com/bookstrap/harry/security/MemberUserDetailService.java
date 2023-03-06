package com.bookstrap.harry.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.MemberRepository;

@Service
public class MemberUserDetailService implements UserDetailsService{

	@Autowired
	private MemberRepository memberDao;
	
	
	@Override
	public UserDetails loadUserByUsername(String memberEmail) throws UsernameNotFoundException {
		
		final Members member = memberDao.findAccountByEmail(memberEmail);
		if (member == null) {
			throw new UsernameNotFoundException("No member found.");
		}
//		UserDetails user = User.withUsername(member.getMemberAccount())
//		.password(member.getMemberPassword())
//		.authorities("USER").build();   //設定Authority
//		return user;
		
		return new CustomUserDetails(member);
	}  

}
