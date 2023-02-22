package com.bookstrap.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.Employees;

public interface EmployeesRepository extends JpaRepository<Employees, Integer>{
	Optional<Employees> findByAccount(String account);
}
