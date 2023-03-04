package com.bookstrap.harry.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstrap.harry.bean.Members;

@Repository
public class CheckLogin {

	@Autowired
	private SessionFactory factory;

//	@SuppressWarnings("unused")
	public Integer checkLogin(Members member) {
		Session session = factory.openSession();
		String querySring = "from Members m where m.memberAccount = :mEmail and m.memberPassword = :mPassword";

		
		
		
		Query<Members> result = session.createQuery(querySring, Members.class);

		result.setParameter("mEmail", member.getMemberAccount());
		result.setParameter("mPassword", member.getMemberPassword());

		Members uniqueResult = result.uniqueResult();
		
				
		session.close();
		
//		if(uniqueResult == null) {
//			return false;
//			
//		}
		
		if(uniqueResult == null) {
			return null;
		}
		
		Integer mValid = uniqueResult.getMemberValid();
				
		return mValid;
		
//		if(uniqueResult == null) {
//			return false;
//		}

		

	}

//	public Integer checkValid(Members member) {
//
//		Session session = factory.openSession();
//		String querySring = "from Members m where m.memberAccount = :mEmail and m.memberPassword = :mPassword";
//
//		Query<Members> result = session.createQuery(querySring, Members.class);
//
//		result.setParameter("mEmail", member.getMemberAccount());
//		result.setParameter("mPassword", member.getMemberPassword());
//
//		Members uniqueResult = result.uniqueResult();
//		Integer valid = uniqueResult.getMemberValid();
//		return valid;
//
//	}


}
