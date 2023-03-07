package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.EBookFavorite;

public interface EBookFavorityRepository extends JpaRepository<EBookFavorite, Integer> {

}
