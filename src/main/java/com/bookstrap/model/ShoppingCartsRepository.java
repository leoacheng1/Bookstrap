package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.ShoppingCarts;
import com.bookstrap.model.pk.ShoppingCartsPK;

public interface ShoppingCartsRepository extends JpaRepository<ShoppingCarts, ShoppingCartsPK> {

//	@Query(value = "from ShoppingCarts where memberId = :memberId")
//	public List<ShoppingCarts> findCartsByMemberId(@Param("memberId") Integer memberId);
//
//	@Query(value = "delete from ShoppingCarts where bookId = :bookId")
//	public void deleteBookById(@Param("bookId") Integer bookId);

	// 根據memberId查詢購車清單
	@Query(value = "from ShoppingCarts where memberId = :memberId")
	public List<ShoppingCarts> findByMemberId(Integer memberId);
	


}
