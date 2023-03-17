package com.bookstrap.harry.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.EBookDetails;
import com.bookstrap.harry.bean.Members;

public interface EBookDetailsRepository extends JpaRepository<EBookDetails, Integer> {

	
	
	
}
