package com.bookstrap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Comment;
import com.bookstrap.model.CommentRepository;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository cDao;
	
	public void insetComment(Comment comment) {
		cDao.save(comment);
	}
}
