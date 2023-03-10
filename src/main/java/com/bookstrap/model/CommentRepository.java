package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstrap.harry.bean.Comment;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

	@Query(value = "select * from Comment where book_id = :bookId", nativeQuery=true)
	public List<Comment> showAllComment(Integer bookId);
	
}