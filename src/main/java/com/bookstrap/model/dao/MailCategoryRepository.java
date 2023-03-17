package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.MailCategory;

public interface MailCategoryRepository extends JpaRepository<MailCategory, Integer> {
	public MailCategory findByCategoryName(String categoryName);
}
