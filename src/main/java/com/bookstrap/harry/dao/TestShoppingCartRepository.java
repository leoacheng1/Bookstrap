package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.TestShoppingCatrs;

public interface TestShoppingCartRepository extends JpaRepository<TestShoppingCatrs, Integer> {

}
