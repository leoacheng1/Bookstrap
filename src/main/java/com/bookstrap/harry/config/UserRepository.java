package com.bookstrap.harry.config;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.Members;

public interface UserRepository extends JpaRepository<Members, Integer> {

	@Query(value = "SELECT * FROM Members WHERE acccount = :userEmail", nativeQuery = true)
	public Members getMemberAccountByUserEmail(@Param("userEmail") String userEmail);
	
//	@Query("from Members where memberAccount = :userEmail")
//	public Members getMemberAccountByUserEmail(@Param("userEmail") String userEmail);
}
