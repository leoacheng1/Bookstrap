package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.Members;

public interface MemberRepository extends JpaRepository<Members, Integer> {

	@Query(value = "SELECT*FROM Members WHERE acccount = :mAccount", nativeQuery = true)
	public Members findIdByEmail(@Param("mAccount") String memberEmail);
	
	
	@Query("SELECT m FROM Members m WHERE m.vertificationCode = ?1")
	public Members findByVerificationCode(String code);
	
	@Query(value = "SELECT*FROM Members WHERE vertification_code = :mCode", nativeQuery = true)
	public Members findByVerifyCode(@Param("mCode") String code);
	
	@Modifying
	@Query(value = "UPDATE Members SET valid = :mValid WHERE member_id = :mId", nativeQuery = true)
	public Integer updateMemberValid(@Param("mValid") Integer valid, @Param("mId") Integer memberId);
	
	
}
