//package com.bookstrap.harry.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.bookstrap.harry.bean.Members;
//import com.bookstrap.harry.dao.CheckLogin;
//import com.bookstrap.harry.dao.MemberRepository;
//import com.bookstrap.harry.dao.UserDetailReposity;
//import com.bookstrap.harry.dao.UserReposity;
//import com.bookstrap.harry.security.MemberUserDetailService;
//
//
//
//@Service
//public class UserDetailServiceImpl implements UserDetailsService {
//
//	@Autowired
//	private MemberRepository mDao;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//
//	Members member = mDao.findAccountByEmail(username);
//
//	if(member == null) {
//		throw new UsernameNotFoundException("User not found");
//	}
//	
//	return new MemberUserDetailService(member);
//	}
//	
//	
//	
//
//}
