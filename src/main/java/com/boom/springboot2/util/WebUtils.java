package com.boom.springboot2.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.boom.springboot2.entity.User;

public class WebUtils {

	public static User getCurrUser() {
		HttpSession session = Servlets.getRequest().getSession();
		Object user = session.getAttribute("user");
		return user == null ? null : (User) user;
	}
	
	public static void setCurrentUser(User currentUser) {
		HttpServletRequest request = Servlets.getRequest();
		request.getSession().invalidate();
		request.getSession(true).setAttribute("user", currentUser);
	}
}
