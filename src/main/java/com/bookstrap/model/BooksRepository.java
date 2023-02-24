package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface BooksRepository extends JpaRepository<Books, Integer> {

	@Query(value = "from Books where name like %:name% or author like %:name% or publisher like %:name%")
	public List<Books> findBookLikeSelector(String name);
	
	@Query(value = "from Books where languages like %:languages% or category like %:languages%")
	public List<Books> findBookBySelector(String languages);
	
	@Query(value = "select * from Books where (languages =:languages) and (category =:category)",nativeQuery = true)
	public  List<Books> getBookBySelector(@Param("languages") String languages,@Param("category")String category);
	
}
