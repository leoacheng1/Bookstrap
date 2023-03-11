package com.bookstrap.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

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
			bComment.setBookId(bookId);
			bComment.setMemberId(memberId);
			bComment.setBook(onebook);
			bComment.setMember(onemember);
			
			cService.insetComment(bComment);
			comments = bService.findCommentByBookId(bookId)	;		
		}
		return "上傳成功";
	}
	
	// (未成功)從書籍id找到評論(關聯會導致相關類別方法出問題)
	@ResponseBody
	@GetMapping("/comment/bookId")// 
	public List<Comment> showCommentByBookId(Integer bookId) {
		return bService.findCommentByBookId(bookId);
	}
	
	// 透過評論id刪除評論
	@DeleteMapping("/comment/delete")
	public String deleteCommentById(Integer commentId) {
		cService.deleteCommentById(commentId);
		return "redirect:/member/main";
	}
	
	@ResponseBody
	@PutMapping("/comment/update")
	public String updateCommentById(@RequestParam("commentId") Integer commentId
			                      ,@RequestParam("content") String content
			                      ,@RequestParam("evaluation") Integer evaluation,Model model) {
		Comment comment = cService.updateCommentById(commentId, content, evaluation);
		model.addAttribute("comment",comment);
		return "更新成功";
	}
	
	// 要改成從會員id抓到發表過的評論
	@ResponseBody
	@GetMapping("/comment/commentId")
	public Comment findCommentByCommentId(@RequestParam("commentId") Integer commentId) {
		return cService.findCommentByCommentId(commentId);
	}
}
