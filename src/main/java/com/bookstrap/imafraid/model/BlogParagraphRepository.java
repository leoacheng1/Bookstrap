package com.bookstrap.imafraid.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.bookstrap.imafraid.bean.BlogParagraph;
@Service
public interface BlogParagraphRepository extends JpaRepository<BlogParagraph, Integer> {

}