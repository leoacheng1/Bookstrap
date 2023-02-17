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


	public boolean checkLogin(Members member) {
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
		
		if(uniqueResult != null) {
			return true;
		}else {
			return false;
		}
		
//		return false;
		
		
//		if(uniqueResult == null) {
//			return false;
//		}

		

	}

	public Integer checkValid(Members member) {

		Session session = factory.openSession();
		String querySring = "from Members m where m.memberAccount = :mEmail and m.memberPassword = :mPassword";

		Query<Members> result = session.createQuery(querySring, Members.class);

		result.setParameter("mEmail", member.getMemberAccount());
		result.setParameter("mPassword", member.getMemberPassword());

		Members uniqueResult = result.uniqueResult();
		Integer valid = uniqueResult.getMemberValid();
		return valid;

	}

//		public Integer checkValid(Members member) {
//			
//			Session session = factory.openSession();
//			String querySring = "from Members m where m.memberValid = :mValid";
//			
//			Query<Members> result = session.createQuery(querySring, Members.class);
//			result.setParameter("mValid", member.getMemberValid());
//			System.out.println("check V:" + member.getMemberValid());
//			Members uniqueResult = result.uniqueResult();
//			Integer valid = uniqueResult.getMemberValid();
//			
//			
//			return valid;
//			
//		}

}
