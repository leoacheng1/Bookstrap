package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.MemberDetails;

public interface MemberDetailRepository extends JpaRepository<MemberDetails, Integer> {

	@Query(value = "SELECT*FROM MemberDetails Where member_id =:mId", nativeQuery = true)
	public MemberDetails useIdFindName(@Param("mId") Integer memberId);
}
