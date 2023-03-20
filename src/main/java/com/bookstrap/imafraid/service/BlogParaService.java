package com.bookstrap.imafraid.service;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.bean.BlogPhotos;
import com.bookstrap.imafraid.model.BlogParagraphRepository;

@Transactional
@Service
public class BlogParaService {
	@Autowired
	private BlogParagraphRepository blogParaDao;

//	@Autowired
//	private BlogParaService blogParaService;
	public BlogParagraph findById(Integer id) {
		Optional<BlogParagraph> op = blogParaDao.findById(id);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}

	public void insertBlog(BlogParagraph bp) {

		blogParaDao.save(bp);
	}

	public List<BlogParagraph> getAllBlogParagraph() {
		List<BlogParagraph> allBlogParagraph = blogParaDao.findAll();

		return allBlogParagraph;
	}

	public List<BlogParagraph> getAllBlogParagraphforMonthselect() {
		List<BlogParagraph> allBlogParagraph = blogParaDao.findAllOrderByDate();

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

	public BlogParagraph getParaById(Integer paragraphId) {
		Optional<BlogParagraph> op = blogParaDao.findById(paragraphId);

		BlogParagraph bp = op.get();
		return bp;
	}

	public String updatePara(Integer id, String pTitle, String pContent, String pAuther, String pCatagory,
			MultipartFile[] pPhoto) {
		Optional<BlogParagraph> op = blogParaDao.findById(id);
		if (op.isEmpty())
			return "查無此篇文章";
		List<BlogPhotos> blogPhoto = new LinkedList<>();
		if (pPhoto == null) {
			BlogParagraph bp = op.get();
			bp.setParagraphTitle(pTitle);
			bp.setParagraphAuther(pAuther);
			bp.setParagraphCatagory(pCatagory);
			bp.setParagraphContent(pContent);
			return "更新成功";
		}

		try {
			if (op.isPresent()) {
				BlogParagraph bp = op.get();
				for (MultipartFile photo : pPhoto) {
					BlogPhotos bPhoto = new BlogPhotos();
					byte[] photoByte;
					photoByte = photo.getBytes();
					bp.setParagraphTitle(pTitle);
					bp.setParagraphAuther(pAuther);
					bp.setParagraphCatagory(pCatagory);
					bp.setParagraphContent(pContent);
					bPhoto.setBlogPhoto(photoByte);
					bPhoto.setBlogparagraph(bp);
					blogPhoto.add(bPhoto);
				}
				bp.setBlogPhotos(blogPhoto);
				return "更新成功";
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "查無此篇文章";

	}

	public String makeItCanSeen(Integer id, Integer showOrNot) {
		Optional<BlogParagraph> optional = blogParaDao.findById(id);
		if (optional.isEmpty())
			return null;
		BlogParagraph paragraph = optional.get();
		paragraph.setIsThisParaShow(showOrNot);
		blogParaDao.save(paragraph);
		return "ok";
	}

	public BlogParagraph findLatestParaByIdNativeQuery() {
		return blogParaDao.findLatestParaByIdNativeQuery();
	}

	public List<BlogParagraph> findCatagory1NativeQuery() {
		return blogParaDao.findCatagory1NativeQuery();
	}

	public List<BlogParagraph> findCatagory2NativeQuery() {
		return blogParaDao.findCatagory2NativeQuery();
	}

	public List<BlogParagraph> findAllNativeQuery() {
		return blogParaDao.findAllNativeQuery();
	}

	public List<BlogParagraph> findParaByMonthNativeQuery(String year, String month) {
		return blogParaDao.findParaByMonthNativeQuery(year, month);
	}
}