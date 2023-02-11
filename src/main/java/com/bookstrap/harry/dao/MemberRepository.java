package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.Members;

public interface MemberRepository extends JpaRepository<Members, Integer> {


}
