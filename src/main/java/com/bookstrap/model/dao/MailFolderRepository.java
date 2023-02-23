package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.MailFolder;

public interface MailFolderRepository extends JpaRepository<MailFolder, Integer> {
}
