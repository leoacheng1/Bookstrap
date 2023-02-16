//package com.bookstrap.harry.dao;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.bookstrap.harry.bean.Members;
//
//@Repository
//public class CheckLogin {
//
//		@Autowired
//		private SessionFactory factory;
//	
//		
//		public boolean checkLogin(Members member) {
//			Session session = factory.openSession();
//			String querySring = "from Members m where m.memberAccount = :mEmail and m.memberPassword = :mPassword";
//			
//			Query<Members> result = session.createQuery(querySring, Members.class);
//			
//			result.setParameter("mEmail", member.getMemberAccount());
//			result.setParameter("mPassword", member.getMemberPassword());
//			
//			Members uniqueResult = result.uniqueResult();
//			
//			if(uniqueResult != null) {
//				return true;
//			}
//			
//			return false;
//			
//		}
//}
