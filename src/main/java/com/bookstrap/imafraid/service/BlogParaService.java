package com.bookstrap.imafraid.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.model.BlogParagraphRepository;

@Transactional
@Service
public class BlogParaService {
	@Autowired
	private BlogParagraphRepository blogParaDao;

	public void insertBlog(BlogParagraph bp) {

		blogParaDao.save(bp);
	}

	public List<BlogParagraph> getAllBlogParagraph() {
		List<BlogParagraph> allBlogParagraph = blogParaDao.findAll();

		return allBlogParagraph;
	}
}
