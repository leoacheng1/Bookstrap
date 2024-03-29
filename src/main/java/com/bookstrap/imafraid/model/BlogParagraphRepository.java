package com.bookstrap.imafraid.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.bookstrap.imafraid.bean.BlogParagraph;
@Service
public interface BlogParagraphRepository extends JpaRepository<BlogParagraph, Integer> {



@Query(value="SELECT TOP(1) * FROM BlogParagraph ORDER BY paragraph_id DESC", nativeQuery = true)
public BlogParagraph findLatestParaByIdNativeQuery();


@Query(value="select * from BlogParagraph where paragraphCatagory = '新書推薦' and isThisParaShow = '1' ORDER BY paragraph_id DESC", nativeQuery = true)
public List<BlogParagraph> findCatagory1NativeQuery();

@Query(value="select * from BlogParagraph where paragraphCatagory = '好書指南' and isThisParaShow = '1' ORDER BY paragraph_id DESC", nativeQuery = true)
public List<BlogParagraph> findCatagory2NativeQuery();

@Query(value="select * from BlogParagraph where isThisParaShow = '1' ORDER BY paragraph_id DESC", nativeQuery = true)
public List<BlogParagraph> findAllNativeQuery();


@Query(value="select * from BlogParagraph where year(paragraphTime)=:year and month(paragraphTime)=:month", nativeQuery = true)
public List<BlogParagraph> findParaByMonthNativeQuery(@Param("year") String year,@Param("month") String month);

@Query(value="  select * from BlogParagraph ORDER BY paragraphTime DESC", nativeQuery = true)
public List<BlogParagraph> findAllOrderByDate();




}
