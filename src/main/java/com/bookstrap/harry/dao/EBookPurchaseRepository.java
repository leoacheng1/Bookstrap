package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.EBookPurchases;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;

public interface EBookPurchaseRepository extends JpaRepository<EBookPurchases, Integer> {

	@Query(value = "FROM EBookPurchases eb WHERE eb.member = :member AND eb.eBook = :eBook")
	public EBookPurchases findPurchaseByMemberAndEBook(@Param("member") Integer memberId, @Param("eBook") Integer ebookId);


}

