package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstrap.harry.bean.Comment;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

	@Query(value = "select * from Comment where book_id = :bookId order by comment_id DESC", nativeQuery=true)
	public List<Comment> findCommentByBookId(Integer bookId);
	
	@Query(value = "select * from Comment where member_id = :memberId order by comment_id DESC", nativeQuery=true)
	public List<Comment> findCommentByMemberId(Integer memberId);
	
	@Query(value = "select * from Comment where comment_id = :commentId", nativeQuery=true)
	public List<Comment> findOneCommentByCommentId(Integer commentId);
}
