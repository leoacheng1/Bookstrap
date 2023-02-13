package com.bookstrap.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstrap.model.bean.Employees;

public interface EmployeesRepository extends JpaRepository<Employees, Integer>{

}
