package com.bookstrap.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class ShopDaoImpl  {
	    @PersistenceContext
	    private EntityManager em;

	    public List<Shops> ShopsByAddress(String place) {
	    	if (em == null) {
	    		System.out.println("em is null!");
	    	}
	        Query query = em.createQuery("from Shops where address like :place");
	        query.setParameter("place", place);
	        System.out.println("size"+query.getResultList().size());
	        return query.getResultList();
	    }
}
