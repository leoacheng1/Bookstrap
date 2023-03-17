package com.bookstrap.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Comment;
import com.bookstrap.model.Books;
import com.bookstrap.model.CommentRepository;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository cDao;
	
	
	
	public void insetComment(Comment comment) {
		cDao.save(comment);
	}
	
	public List<Comment> showCommentByBookId(Integer bookId) {
	    return cDao.showAllComment(bookId);	    	    
	}
	
	public Comment findCommentByCommentId(Integer commentId) {
		Optional<Comment> comment = cDao.findById(commentId);
		
		if(comment.isPresent()) {
			return comment.get();
		}
		return null;
	}
	
	public void deleteCommentById(Integer commentId) {
		cDao.deleteById(commentId);
	}
	
	public Comment updateCommentById(Integer commentId,String content,Integer evaluation) {
		Optional<Comment> optional = cDao.findById(commentId);
		
		if(optional.isPresent()) {
			Comment comment = optional.get();
			comment.setCommentId(commentId);
			comment.setContent(content);
			comment.setEvaluation(evaluation);
			System.out.println("有這筆資料");
			return comment;
		}
		System.out.println("沒有這筆資料");
		return null;
	}
}
