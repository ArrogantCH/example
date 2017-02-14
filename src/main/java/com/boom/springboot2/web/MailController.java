package com.boom.springboot2.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.springboot2.entity.Register;
import com.boom.springboot2.service.RegisterService;
import com.boom.springboot2.util.Result;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String mailVerification(String userId,String Verification){
		Result<Register> result = registerService.mailVail(userId, Verification);
		if(result.isError()){
			return "redirect:/login";
		}
		return "registerOK";
	}
}
