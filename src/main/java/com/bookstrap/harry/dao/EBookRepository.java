package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.EBooks;

public interface EBookRepository extends JpaRepository<EBooks, Integer> {

}
