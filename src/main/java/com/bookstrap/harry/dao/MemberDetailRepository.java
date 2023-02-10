package com.bookstrap.harry.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.harry.bean.MemberDetails;

public interface MemberDetailRepository extends JpaRepository<MemberDetails, Integer> {

}
