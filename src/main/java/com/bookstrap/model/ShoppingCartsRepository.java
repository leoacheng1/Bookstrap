package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.ShoppingCarts;

public interface ShoppingCartsRepository extends JpaRepository<ShoppingCarts, Integer> {

}
