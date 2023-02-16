package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.pk.ShoppingCartsPK;

public interface ShoppingCartsRepository extends JpaRepository<ShoppingCarts, ShoppingCartsPK> {

}
