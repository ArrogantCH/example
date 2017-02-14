package com.boom.springboot2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.boom.springboot2.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
	User findByPhone(String phone);
	
	User findByUserName(String userName);
}
