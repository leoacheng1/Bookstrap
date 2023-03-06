//package com.bookstrap.harry.config;
//
//import java.util.List;
//
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.context.annotation.Configuration;
//
//import com.bookstrap.harry.bean.Members;
//import com.bookstrap.harry.bean.Role;
//import com.bookstrap.harry.dao.MemberRepository;
//
//@Configuration
//public class DatabaseLoader {
//
//	
//	private MemberRepository repo;
//	
//	public DatabaseLoader(MemberRepository repo) {
//		this.repo = repo;
//	}
//	
//	public CommandLineRunner initializeDatabase() {
//		return args ->{
//			Members m1 = new Members("123@gmail.com", "123", Role.USER);
//			Members a1 = new Members("456@gmail.com", "123", Role.ADMIN);
//		repo.saveAll(List.of(m1, a1));
//		
//		System.out.println("sample dabase initialized");
//		};
//		
//	}
//
//}
