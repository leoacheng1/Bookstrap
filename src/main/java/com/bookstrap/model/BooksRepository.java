package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


public interface BooksRepository extends JpaRepository<Books, Integer> {

	@Query(value = "from Books where name like %:name% or author like %:name% or publisher like %:name%")
	public List<Books> findBookLikeSelector(String name);
	
	@Query(value = "from Books where languages like %:languages% or category like %:languages%")
	public List<Books> findBookBySelector(String languages);
	
	@Query(value = "select * from Books where languages in (:languages)", nativeQuery=true)
	public List<Books> getBookByLanguages(@Param("languages") List<String> languages);
	
	@Query(value = "select * from Books where category in (:category)", nativeQuery=true)
	public List<Books> getBookByCategory(@Param("category") List<String> category);
	
	@Query(value = "select * from Books where category in (:category)", nativeQuery=true)
	public List<Books> findBookByCategory(String category);
	
//	@Query(value = "select * from Books where (languages =:languages) and (category =:category)",nativeQuery = true)
//	public  List<Books> getBookBySelector(@Param("languages") String languages,@Param("category")String category);
	
	@Query(value = "select * from Books where languages in (:languages) AND category in (:category)", nativeQuery=true)
	public List<Books> getBookBySelector(@Param("languages") List<String> languages,@Param("category") List<String> category);
	
}
