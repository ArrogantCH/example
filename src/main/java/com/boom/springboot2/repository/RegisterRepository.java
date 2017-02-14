package com.boom.springboot2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.boom.springboot2.entity.Register;

@Repository
public interface RegisterRepository extends JpaRepository<Register, String>{

	Register findByUserId(String userId);
	
}
