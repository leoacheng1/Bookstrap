package com.bookstrap.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ShopsRepository extends JpaRepository<Shops, Integer>{

	
	@Query(value="from Shops where address like %:address%")
    public List<Shops> findShopsLike(@Param("address") String address);
}
