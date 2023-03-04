package com.bookstrap.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

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

	@Query(value = "from Books where bookId = :bookId")
	public List<Books> findBooksByBookId(Integer bookId);
	
	@Query(value = "from ShoppingCarts where bookId = :bookId")
	public Optional<ShoppingCarts> findBookByBookId(Integer bookId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM ShoppingCarts where bookId = :bookId")
	public void deleteBookByBookId(Integer bookId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM ShoppingCarts where memberId = :memberId")
	public void deleteAllByMemberId(Integer memberId);

	@Transactional
	@Modifying
	@Query("UPDATE ShoppingCarts SET amount = :amount WHERE bookId = :bookId")
	public void updateCartItemAmount(@Param("amount") Integer amount, @Param("bookId") Integer bookId);
}

