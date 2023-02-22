package com.bookstrap.imafraid.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.bookstrap.imafraid.bean.BlogPhotos;
import com.bookstrap.imafraid.model.BlogPhotosRepository;

@Controller
public class BlogPhotoController {
	@Autowired
	private BlogPhotosRepository blogPhotosDao;
	
//	@PostMapping("/blog/newpost")
//	public BlogPhotos insert1() {
//		
//	}

}
