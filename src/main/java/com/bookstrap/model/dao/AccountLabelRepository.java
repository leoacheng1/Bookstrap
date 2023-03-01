package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.AccountLabel;

public interface AccountLabelRepository extends JpaRepository<AccountLabel, Integer> {
	
}
