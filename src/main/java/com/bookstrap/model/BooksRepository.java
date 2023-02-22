package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BooksRepository extends JpaRepository<Books, Integer> {

	@Query(value = "from Books where name = ?1")
	public Books findBookByName(String name);
	
}
