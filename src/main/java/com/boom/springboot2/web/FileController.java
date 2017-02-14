package com.boom.springboot2.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.boom.springboot2.service.UserService;
import com.boom.springboot2.util.Servlets;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest request){
		List<MultipartFile> files = ((MultipartHttpServletRequest)request).getFiles("file");
		String url = Servlets.getRequest().getServletContext().getRealPath("/file");
		System.err.println("url:"+url);
		userService.fileUpload(files, url);
		return "upload success";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String filePage(){
		return "user/fileUp";
	}
}
