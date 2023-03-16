package com.bookstrap.harry.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.EBookPurchases;

public interface EBookPurchaseRepository extends JpaRepository<EBookPurchases, Integer> {

	@Query(value = "FROM EBookPurchases eb WHERE eb.member = :member AND eb.eBook = :eBook")
	public EBookPurchases findPurchaseByMemberAndEBook(@Param("member") Integer memberId, @Param("eBook") Integer ebookId);


	@Query(value = "FROM EBookPurchases eb WHERE eb.member.memberId = :mId")
	public Page<EBookPurchases> getAllEBookPurchaseByMember(Pageable page, @Param("mId") Integer memberId);
}

