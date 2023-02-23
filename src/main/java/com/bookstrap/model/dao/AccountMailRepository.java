package com.bookstrap.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.AccountMail;
import com.bookstrap.model.pk.AccountMailPK;

public interface AccountMailRepository extends JpaRepository<AccountMail, AccountMailPK> {
}
