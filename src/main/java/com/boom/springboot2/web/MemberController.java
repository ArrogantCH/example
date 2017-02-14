package com.boom.springboot2.web;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boom.springboot2.entity.Member;
import com.boom.springboot2.service.MemberService;
import com.boom.springboot2.util.Result;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addMember(){
		return "member/addMember";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addMember(Member member){
		Result<Member> result = memberService.addMember(member);
		return "member/addMember";
	}
	
	@RequestMapping(value = "/query", method = RequestMethod.POST)
	public String queryMember(@RequestParam(value = "p", defaultValue = "0") int pageIndex, String realName, String phone, String idCard, String email, Model m){
		Page<Member> p = memberService.findMerchantPageByCondition(pageIndex, realName, phone, idCard, email, 20);
		if(p.getTotalPages()>0){
			m.addAttribute("p", p);
		}
		m.addAttribute("realName", realName);
		m.addAttribute("phone", phone);
		m.addAttribute("idCard", idCard);
		m.addAttribute("email", email);
		return "member/memberList";
	}
	
	@RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
	public String updateList(@PathVariable("id") String id, Model m){
		Member member = memberService.findMemberById(id);
		m.addAttribute("member", member);
		return "member/updateMember";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Member member){
		memberService.addMember(member);
		return "redirect:/member/memberList";
	}
	
	@RequestMapping("/memberList")
	public String userList(@RequestParam(value = "p", defaultValue = "0") int pageIndex, Model m) {
		Page<Member> p = memberService.findMemberPage(pageIndex, 20);
		if(p.getTotalPages()>0){
			m.addAttribute("p", p);
		}
		return "member/memberList";
	}
	
	@RequestMapping("/download")
	public String download(HttpServletResponse response, String realName, String phone, String idCard, String email){
		memberService.exportExcelByCondition(response, realName, phone, idCard, email);
		return null;
	}
}
