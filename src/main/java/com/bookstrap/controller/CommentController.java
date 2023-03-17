package com.bookstrap.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/member/comments")
	public String goToMemberCommentsPage() {
		return "/member/Main/MyComments";
	}
	
	@ResponseBody
	@PostMapping("/comment/post")
	public String insertComment(@RequestParam("content") String content
			                   ,@RequestParam("evaluation") Integer evaluation
			                   ,@RequestParam("bookId") Integer bookId
			                   ,@RequestParam("memberId") Integer memberId) {
		List<Comment> comments = new ArrayList<>();
		
		if(memberId != null) {
			Books onebook = bService.getBookById(bookId);//綁定書籍id
			Members onemember = memberService.findById(memberId);//綁定會員id
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
	
	// 會員透過評論id刪除評論 -> 跳至我的評論頁面
	@DeleteMapping("/comment/member/delete")
	public String deleteCommentByIdWithMember(Integer commentId) {
		cService.deleteCommentById(commentId);
		return "redirect:/member/comments";
	}
	
	// 管理員透過評論id刪除評論 -> 跳至所有評論頁面
	@DeleteMapping("/comment/admin/delete")
	public String deleteCommentByIdWithAdmin(Integer commentId) {
		cService.deleteCommentById(commentId);
		return "redirect:/comment/allPage";
	}
	
	// 從會員的所有評論中找到其中一條評論
	@GetMapping("/comment/editPage")
	public String getCommentById(@RequestParam("commentId")Integer commentId,Model model) {
		Comment comment = cService.findCommentByCommentId(commentId);
		model.addAttribute("comment",comment);
		return "/member/Main/MyComments";
	}
	
	// 從會員的所有評論中找到其中一條評論
	@ResponseBody
	@GetMapping("/comment/{commentId}")
	public Comment getCommentById(@PathVariable("commentId")Integer commentId) {
		return cService.findCommentByCommentId(commentId);	
	}
	
	// 更新評論
	@ResponseBody
	@PutMapping("/comment/update")
	public String updateCommentById(@RequestParam("commentId") Integer commentId
			                       ,@RequestParam("content") String content
			                       ,@RequestParam("evaluation") Integer evaluation) {
		Comment comment = cService.updateCommentById(commentId, content, evaluation);
		return "更新成功";		
	}
	
	// 會員發表過的評論(會員中心)
//	@GetMapping("/comment/memberId")
//	public String findCommentByMemberId(@RequestParam("memberId") Integer memberId,Model model) {
//		List<Comment> list = cService.findCommentByMemberId(memberId);
//		model.addAttribute("memberComment",list);
//		return "/member/Main/MyComments";
//	}
	
	// 會員發表過的評論(會員中心page)
	@GetMapping("/comment/memberPage")
	public String showCommentByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber
			                       ,@RequestParam("memberId") Integer memberId
			                       ,Model model
			                       ,HttpSession session) {
		session.setAttribute("memberId", memberId);
		Integer result = (Integer) session.getAttribute("memberId");
		Page<Comment> page = cService.showCommentPageByMemberId(pageNumber,result);
		Model addAttribute = model.addAttribute("memberComment",page);
		return "/member/Main/MyComments";
	}
	
	// 所有評論(會員中心)的分頁
	@ResponseBody
	@GetMapping("/comment/ajax/page")
	public Page<Comment> likeBook(Integer pageNumber,@RequestParam("memberId") Integer memberId,HttpSession session) {
		session.setAttribute("memberId", memberId);
		Integer result = (Integer) session.getAttribute("memberId");
        
		Page<Comment> page = cService.showCommentPageByMemberId(pageNumber, result);

		return page;
	}
	
	// 所有評論(管理員介面)
	@GetMapping("/comment/all")
	private String findAllComments(Model model) {
		List<Comment> list = cService.findAllComments();
		model.addAttribute("comments",list);
		return "books/showComments";
	}
	
	// 所有評論的分頁(管理員介面page)
	@GetMapping("/comment/allPage")
	public String showAllCommentsByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,Model model) {
		Page<Comment> page = cService.showAllCommentsByPage(pageNumber);
		model.addAttribute("page",page);
		return "books/showComments";
	}
}
