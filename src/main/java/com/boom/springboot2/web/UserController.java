package com.boom.springboot2.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boom.springboot2.entity.User;
import com.boom.springboot2.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/userList")
	public String userList(
			@RequestParam(value = "p", defaultValue = "0") int pageIndex,
			Model m) {
		Page<User> p = userService.findUserPage(pageIndex, 20);
		m.addAttribute("p", p);
		return "user/userList";
	}

}
