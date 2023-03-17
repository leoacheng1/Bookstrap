package com.bookstrap.harry.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.Favorite;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.model.Books;

public interface BookFavorityRepository extends JpaRepository<Favorite, Integer> {

	@Query("SELECT f FROM Favorite f WHERE f.book = :book AND f.member = :member")
	public Optional<Favorite> findByMemberAndBook(@Param("member") Members member, @Param("book") Books book);

	public List<Favorite> findByMember(@Param("member") Members member);

	@Modifying
	@Query("DELETE FROM Favorite f WHERE f.member.memberId = :memberId AND f.book.id = :bookId")
	public void deleteByMemberAndBook(@Param("memberId") Integer memberId, @Param("bookId") Integer bookId);
	
}
