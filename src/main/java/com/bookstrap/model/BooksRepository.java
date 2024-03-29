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
	
	@Query(value = "select * from Books where languages in (:languages)", nativeQuery=true)
	public List<Books> getBookByLanguages(@Param("languages") List<String> languages);
	
	@Query(value = "select * from Books where category in (:category)", nativeQuery=true)
	public List<Books> getBookByCategory(@Param("category") List<String> category);
	
//	@Query(value = "select top 5 * from Books where category in (:category) <> book_id =:book_id", nativeQuery=true)
//	public List<Books> findBookByCategory(String category);
	
	public List<Books> findTop5ByCategoryAndIdNot(String category, Integer id);
	
	@Query(value = "select * from Books where author in (:author)", nativeQuery=true)
	public List<Books> findBookByAuthor(String author);
	
//	@Query(value = "select * from Books where (languages =:languages) and (category =:category)",nativeQuery = true)
//	public  List<Books> getBookBySelector(@Param("languages") String languages,@Param("category")String category);
	
	@Query(value = "select * from Books where languages in (:languages) AND category in (:category)", nativeQuery=true)
	public List<Books> getBookBySelector(@Param("languages") List<String> languages,@Param("category") List<String> category);
	
	@Query(value = "select top 5* from Books where languages in (:languages) order by publish_date DESC", nativeQuery=true)
	public List<Books> getBookByDate(@Param("languages") String languages);
	
}
