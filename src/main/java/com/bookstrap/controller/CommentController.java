package com.bookstrap.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.CDATASection;

import com.bookstrap.harry.bean.Comment;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberService;
import com.bookstrap.model.Books;
import com.bookstrap.service.BooksService;
import com.bookstrap.service.CommentService;


@Controller
public class CommentController {

	@Autowired
	private CommentService cService;
	
	@Autowired
	private BooksService bService;

	@Autowired
	private MemberService memberService;
	
	@ResponseBody
	@PostMapping("/comment/post")
	public String insertComment(@RequestParam("content") String content
			                   ,@RequestParam("evaluation") Integer evaluation
			                   ,@RequestParam("bookId") Integer bookId
			                   ,@RequestParam("memberId") Integer memberId) {
		List<Comment> comments = new ArrayList<>();
		
		if(memberId != null) {
			Books onebook = bService.getBookById(bookId);//綁定書籍id
			Members onemember = memberService.findById(memberId);
			Comment bComment = new Comment();
			bComment.setContent(content);
			bComment.setEvaluation(evaluation);
			bComment.setDate(new Timestamp(new Date().getTime()));
			bComment.setBookId(bookId);
			bComment.setMemberId(memberId);
			bComment.setBook(onebook);
			bComment.setMember(onemember);
			
			cService.insetComment(bComment);
			comments = bService.findCommentByBookId(bookId)	;		
		}
		return "上傳成功";
	}
	
	// 從書籍id找到評論(商城使用)
	@ResponseBody
	@GetMapping("/comment/bookId")
	public List<Comment> findCommentByBookId(Integer bookId) {
		return cService.findCommentByBookId(bookId);
	}
	
	// 透過評論id刪除評論
	@DeleteMapping("/comment/delete")
	public String deleteCommentById(Integer commentId) {
		cService.deleteCommentById(commentId);
		return "redirect:/member/main";
	}
	
	// 更新評論
	@ResponseBody
	@PutMapping("/comment/update")
	public String updateCommentById(@RequestParam("commentId") Integer commentId
			                      ,@RequestParam("content") String content
			                      ,@RequestParam("evaluation") Integer evaluation,Model model) {
		Comment comment = cService.updateCommentById(commentId, content, evaluation);
		model.addAttribute("comment",comment);
		return "更新成功";
	}
	
	// 要改成從會員id抓到發表過的評論(會員中心)
	@ResponseBody
	@GetMapping("/comment/commentId")
	public Comment findCommentByCommentId(@RequestParam("commentId") Integer commentId) {
		return cService.findCommentByMemberId(commentId);
	}
	
	@GetMapping("/comment/all")
	private String findAllComments(Model model) {
		List<Comment> list = cService.findAllComments();
		model.addAttribute("comments",list);
		return "books/showComments";
	}
	
	// 所有書籍分頁(管理員介面)
	@GetMapping("/comment/allPage")
	public String showAllCommentsByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,Model model) {
		Page<Comment> page = cService.showAllCommentsByPage(pageNumber);
		model.addAttribute("page",page);
		return "books/showComments";
	}
}
