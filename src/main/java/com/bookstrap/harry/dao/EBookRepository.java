package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstrap.harry.bean.EBooks;

public interface EBookRepository extends JpaRepository<EBooks, Integer> {

//	@Query(value = "SELECT * FROM EBooks WHERE ")
//	public void getPDFById(Integer eBookId);
	
}
