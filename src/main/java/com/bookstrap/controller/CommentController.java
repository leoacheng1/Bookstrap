package com.bookstrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.service.MemberService;
import com.bookstrap.service.BookDetailsService;
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
	
	public String insertComment(@RequestParam("content") String content
			                   ,@RequestParam("evaluation") Integer evaluation
			                   ,@RequestParam("bookId") Integer bookId
			                   ,@RequestParam("memberId") Integer memberId) {
		return null;
	}
}
