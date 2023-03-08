package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.Comment;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

}
