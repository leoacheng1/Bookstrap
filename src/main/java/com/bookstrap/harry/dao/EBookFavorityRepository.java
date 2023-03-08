package com.bookstrap.harry.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBooks;
import com.bookstrap.harry.bean.Members;

public interface EBookFavorityRepository extends JpaRepository<EBookFavorite, Integer> {

	@Query("SELECT e FROM EBookFavorite e WHERE e.eBook = :eBook AND e.member = :member")
	public Optional<EBookFavorite> findByMemberAndEBook(@Param("member") Members member, @Param("eBook") EBooks ebook);

	public List<EBookFavorite> findByMember(@Param("member") Members member);

	@Modifying
	@Query("DELETE FROM EBookFavorite e WHERE e.member.memberId = :memberId AND e.eBook.eBookId = :eBookId")
	public void deleteByMemberAndEBook(@Param("memberId") Integer memberId, @Param("eBookId") Integer eBookId);
}
