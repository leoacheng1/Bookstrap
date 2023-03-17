package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.model.bean.NewShoppingCarts;

public interface NewShoppingCartsRepository extends JpaRepository<NewShoppingCarts, Integer> {

	@Query(value = "select * from NewShoppingCarts where member_Id = :memberId", nativeQuery = true)
	public List<NewShoppingCarts> findByMemberId(@Param("memberId") Integer memberId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM NewShoppingCarts where memberId = :memberId")
	public void deleteAllByMemberId(@Param("memberId")Integer memberId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM NewShoppingCarts where cartId = :cartId")
	public void deleteByCartId(Integer cartId);

	@Transactional
	@Modifying
	@Query(value = "UPDATE NewShoppingCarts SET amount = :amount WHERE cartId = :cartId")
	public void updateAmountByCartId(@Param("amount") Integer amount,@Param("cartId") Integer cartId);
}
