package com.boom.springboot2.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.boom.springboot2.entity.Member;
import com.boom.springboot2.repository.MemberRepository;
import com.boom.springboot2.util.ExcelUtils;
import com.boom.springboot2.util.Result;
import com.boom.springboot2.util.WebUtils;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	public Result<Member> addMember(Member member){
		System.err.println("user:"+WebUtils.getCurrUser());
		member.setOwner(WebUtils.getCurrUser());
		memberRepository.saveAndFlush(member);
		return Result.createForOk(member);
	}
	
	public Page<Member> findMerchantPageByCondition(int pageIndex, String realName, String phone, String idCard, String email,int pageSize) {
		Pageable p = new PageRequest(pageIndex, pageSize);
		Specification<Member> specification = new Specification<Member>() {
			@Override
			public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<Predicate>();

				/* 根据姓名 */
				if (!StringUtils.isEmpty(realName)) {
					predicates.add(criteriaBuilder.equal(root.get("realName"), realName.trim()));
				}
				/* 根据手机号 */
				if (!StringUtils.isEmpty(phone)) {
					predicates.add(criteriaBuilder.equal(root.get("phone"), phone.trim()));
				}
				/* 根据身份证 */
				if (!StringUtils.isEmpty(idCard)) {
					predicates.add(criteriaBuilder.equal(root.get("idCard"), idCard.trim()));
				}
				/* 根据邮箱 */
				if (!StringUtils.isEmpty(email)) {
					predicates.add(criteriaBuilder.equal(root.get("email"), email.trim()));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[] {}));
			}
		};
		return memberRepository.findAll(specification, p);
	}
	
	public List<Member> findMerchantByCondition(String realName, String phone, String idCard, String email) {
		Specification<Member> specification = new Specification<Member>() {
			@Override
			public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<Predicate>();

				/* 根据姓名 */
				if (!StringUtils.isEmpty(realName)) {
					predicates.add(criteriaBuilder.equal(root.get("realName"), realName.trim()));
				}
				/* 根据手机号 */
				if (!StringUtils.isEmpty(phone)) {
					predicates.add(criteriaBuilder.equal(root.get("phone"), phone.trim()));
				}
				/* 根据身份证 */
				if (!StringUtils.isEmpty(idCard)) {
					predicates.add(criteriaBuilder.equal(root.get("idCard"), idCard.trim()));
				}
				/* 根据邮箱 */
				if (!StringUtils.isEmpty(email)) {
					predicates.add(criteriaBuilder.equal(root.get("email"), email.trim()));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[] {}));
			}
		};
		return memberRepository.findAll(specification);
	}
	
	public Page<Member> findMemberPage(int pageIndex, int pageSize) {
		Pageable p = new PageRequest(pageIndex, pageSize);
		return memberRepository.findAll(p);
	}
	
	
	public Member findMemberById(String id){
		Member member = memberRepository.findById(id);
		return member;
	}
	
	/**
	 * 下载所有信息
	 */
	public void exportExcel(HttpServletResponse response){
		List<Member> memberList = memberRepository.findAll();
		List<Map<String, Object>> list = getMapByList(memberList);
		String fileName = "会员信息表";
		String[] columnNames = {"序号","姓名","性别","手机","邮箱","地址"};
		String[] keys = {"seq","realName","gender","phone","email","address"};
		ExcelUtils.download(fileName, columnNames, keys, list, response);
	}
	
	
	/**
	 * 根据条件下载信息
	 */
	public void exportExcelByCondition(HttpServletResponse response, String realName, String phone, String idCard, String email){
		List<Member> memberList = findMerchantByCondition(realName, phone, idCard, email);
		List<Map<String, Object>> list = getMapByList(memberList);
		String fileName = "会员信息表";
		String[] columnNames = {"序号","姓名","性别","手机","邮箱","地址"};
		String[] keys = {"seq","realName","gender","phone","email","address"};
		ExcelUtils.download(fileName, columnNames, keys, list, response);
	}
	
	
	public List<Map<String, Object>> getMapByList(List<Member> memberList){
		if(memberList.isEmpty()){
			return null;
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        list.add(map);
		for (int i = 0; i < memberList.size(); i++) {
			Member member =memberList.get(i);
			Map<String, Object> mapObject = new HashMap<String, Object>();
			mapObject.put("seq", i+1);
			mapObject.put("realName", member.getRealName());
			mapObject.put("gender", member.getGender());
			mapObject.put("phone", member.getPhone());
			mapObject.put("email", member.getEmail());
			mapObject.put("address", member.getAddress());
			list.add(mapObject);
		}
		return list;
	}
}
