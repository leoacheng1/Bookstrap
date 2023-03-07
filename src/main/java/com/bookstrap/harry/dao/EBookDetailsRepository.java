package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.EBookDetails;

public interface EBookDetailsRepository extends JpaRepository<EBookDetails, Integer> {

}
