//package com.bookstrap.harry.dao;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//
//import com.bookstrap.harry.bean.Members;
//
//public interface MemberRepository extends JpaRepository<Members, Integer> {
//
//	@Query(value = "SELECT*FROM Members WHERE acccount = :mAccount", nativeQuery = true)
//	public Members findIdByEmail(@Param("mAccount") String memberEmail);
//	
//}
