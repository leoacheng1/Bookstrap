package com.bookstrap.harry.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.MemberDetails;

public interface MemberDetailRepository extends JpaRepository<MemberDetails, Integer> {

	@Query(value = "SELECT * FROM MemberDetails Where member_id =:mId", nativeQuery = true)
	public MemberDetails useIdFindName(@Param("mId") Integer memberId);
	
	@Query(value = "FROM MemberDetails md WHERE md.memberLastName LIKE %:mLName%")
	public Page<MemberDetails> findMemberLastNameLike(@Param("mLName") String memberLastName, Pageable pageNumber);

	@Query(value = "FROM MemberDetails md WHERE md.memberFirstName LIKE %:mFName%")
	public Page<MemberDetails> findMemberFirstNameLike(@Param("mFName") String memberLastName, Pageable pageNumber);

	@Query(value = "FROM MemberDetails md WHERE md.memberSex LIKE %:mG%")
	public Page<MemberDetails> findMemberGenderLike(@Param("mG") String memberGender, Pageable pageNumber);

	@Query(value = "FROM MemberDetails md WHERE md.memberAddress LIKE %:mG%")
	public Page<MemberDetails> findMemberAddressLike(@Param("mG") String memberAddress, Pageable pageNumber);
}
