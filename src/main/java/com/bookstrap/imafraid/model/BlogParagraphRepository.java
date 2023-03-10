package com.bookstrap.imafraid.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.bookstrap.imafraid.bean.BlogParagraph;
@Service
public interface BlogParagraphRepository extends JpaRepository<BlogParagraph, Integer> {



@Query(value="SELECT TOP(1)*  FROM BlogParagraph ORDER BY paragraph_id DESC", nativeQuery = true)
public BlogParagraph findLatestParaByIdNativeQuery();

}