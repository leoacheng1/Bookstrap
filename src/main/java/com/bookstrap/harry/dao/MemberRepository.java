package com.bookstrap.harry.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.Members;

//JPQL 不支持使用 INSERT
//不用@Repository
//使用 @Modifying 進行修飾. 以通知 SpringData， 這是一個 UPDATE 或 DELETE 操作 
//UPDATE 或 DELETE 操作需要使用事務，此時需要定義 Service 層，在 Service 層的方法上添加事務操作

public interface MemberRepository extends JpaRepository<Members, Integer> {

	@Query(value = "SELECT * FROM Members WHERE acccount = :mAccount", nativeQuery = true)
	public Members findIdByEmail(@Param("mAccount") String memberEmail);
	
	
	@Query("SELECT m FROM Members m WHERE m.vertificationCode = ?1")
	public Members findByVerificationCode(String code);
	
	@Query(value = "SELECT * FROM Members WHERE vertification_code = :mCode", nativeQuery = true)
	public Members findByVerifyCode(@Param("mCode") String code);
	
	@Modifying
	@Query(value = "UPDATE Members SET memberValid = :mValid WHERE memberId = :mId")
	public Integer updateMemberValid(@Param("mValid") Integer valid, @Param("mId") Integer memberId);
	
	@Query()
	public Members findByResetPasswordToken(String token);
		
	@Query("SELECT m FROM Members m WHERE m.memberAccount = :mAccount")
	public Members findAccountByEmail(@Param("mAccount") String memberEmail);
	
//	concat('%',:mId,'%')
	@Query(value = "FROM Members m WHERE m.memberId LIKE concat('%',:mId,'%')")
	public Page<Members> findMemberIdLike(@Param("mId") String memberId, Pageable pageNumber);
	
	@Query(value = "FROM MemberDetails m WHERE m.memberEmail LIKE %:mEmail%")
	public Page<Members> findMemberEmailLike(@Param("mEmail") String memberEmail, Pageable pageNumber);
}
