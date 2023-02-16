package com.bookstrap.imafraid.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.imafraid.bean.BlogPhotos;

public interface BlogPhotosRepository extends JpaRepository<BlogPhotos, Integer> {

}
