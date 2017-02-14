package com.boom.springboot2.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boom.springboot2.entity.User;
import com.boom.springboot2.service.RegisterService;
import com.boom.springboot2.service.UserService;
import com.boom.springboot2.util.Jacksons;
import com.boom.springboot2.util.Result;
import com.boom.springboot2.util.WebUtils;

@Controller
public class PassController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.err.println("------------进来了");
		return "login2";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String user, String passw){
		if (StringUtils.isEmpty(user) || StringUtils.isEmpty(passw)) {
			return "redirect:/login";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/loginVer")
	@ResponseBody
	public String loginVerification(String user,String passw){
		Result<User> result = userService.loginVerification(user, passw);
		if(result.isOk()){
			WebUtils.setCurrentUser(result.getValue());
		}
		return Jacksons.writeJson(result);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String userName, String password, String email, String phone){
		Result<User> result = userService.saveUser(userName, password, email, phone);
		if(result.isError()){
			return "redirect:/login";
		}
		registerService.registVali(phone);
		return "redirect:/login";
	}
	
}
