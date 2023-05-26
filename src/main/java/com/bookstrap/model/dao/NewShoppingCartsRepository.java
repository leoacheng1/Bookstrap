package com.bookstrap.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.bean.NewShoppingCarts;

public interface NewShoppingCartsRepository extends JpaRepository<NewShoppingCarts, Integer> {

	@Query(value = "FROM NewShoppingCarts WHERE memberId = :memberId")
	public List<NewShoppingCarts> findByMemberId(@Param("memberId") Integer memberId);

	@Query(value = "FROM NewShoppingCarts WHERE bookId IN (:bookIds)")
	public List<NewShoppingCarts> findByBookIds(@Param("bookIds") List<Integer> bookIds);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM NewShoppingCarts WHERE memberId = :memberId")
	public void deleteAllByMemberId(@Param("memberId") Integer memberId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM NewShoppingCarts WHERE cartId = :cartId")
	public void deleteByCartId(Integer cartId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM NewShoppingCarts WHERE bookId IN (:bookIds)")
	public void deleteByBookIds(List<Integer> bookIds);

	@Transactional
	@Modifying
	@Query(value = "UPDATE NewShoppingCarts SET amount = :amount WHERE cartId = :cartId")
	public void updateAmountByCartId(@Param("amount") Integer amount, @Param("cartId") Integer cartId);
}
