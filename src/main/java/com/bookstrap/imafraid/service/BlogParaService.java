package com.bookstrap.imafraid.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
	public String deleteParaById(Integer id) {
				try {
					blogParaDao.deleteById(id);
				} catch (EmptyResultDataAccessException e) {
					return "沒有找到這筆資料";
				}
			return "執行刪除作業";
	}
	public String updatePara(Integer id,String pTitle,String pContent,String pAuther,String pCatagory) {
		Optional <BlogParagraph> op =blogParaDao.findById(id);
			if(op.isPresent()) {
				BlogParagraph bp = op.get();
				bp.setParagraphTitle(pTitle);
				bp.setParagraphAuther(pAuther);
				bp.setParagraphCatagory(pCatagory);
				bp.setParagraphContent(pContent);
				return "/blog/blogIndex";
				
			}
		return "查無此篇文章";
	}
}

