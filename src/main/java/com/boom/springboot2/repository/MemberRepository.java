package com.boom.springboot2.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.boom.springboot2.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, String>{

	Page<Member> findAll(Specification<Member> specification, Pageable p);
	
	List<Member> findAll(Specification<Member> specification);
	
	Member findById(String id);
}
