package com.bookstrap.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.Comment;
import com.bookstrap.harry.dao.MemberRepository;
import com.bookstrap.model.Books;
import com.bookstrap.model.CommentRepository;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository cDao;	
	
	private MemberRepository mDao;
	
	public void insetComment(Comment comment) {
		cDao.save(comment);
	}
	
	public List<Comment> findCommentByBookId(Integer bookId) {
	    return cDao.findCommentByBookId(bookId);	    	    
	}
	
	public void deleteCommentById(Integer commentId) {
		cDao.deleteById(commentId);
	}
	
	public Comment getCommentById(Integer commentId) {
		Optional<Comment> optional = cDao.findById(commentId);
		
		if(optional.isPresent()) {
			optional.get().getBook().getName();
		}
		return null;
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
	
	public List<Comment> findAllComments() {
		return cDao.findAll();
	}
	
	// 所有評論分頁(放在管理員介面)
	public Page<Comment> showAllCommentsByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "commentId");
		Page<Comment> page = cDao.findAll(pgb);
		return page;
	}
	
	public List<Comment> findCommentByMemberId(Integer memberId) {
		return cDao.findCommentByMemberId(memberId);
	}
	
	// 從會員id抓到發表過的評論(用page，放在會員中心)
	public Page<Comment> showCommentPageByMemberId(Integer pageNumber,Integer memberId) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "date");
		List<Comment> list = cDao.findCommentByMemberId(memberId);
		int start = (int) pgb.getOffset();
	    int end = Math.min((start + pgb.getPageSize()), list.size());
		Page<Comment> page = new PageImpl<Comment>(list.subList(start, end),pgb,list.size());
		return page;
	}
	
}
