package com.boom.springboot2.util;

import org.springframework.util.DigestUtils;

public class Digests extends DigestUtils{

	public static String md5Digest(String message){
		return md5DigestAsHex(message.getBytes());
	} 
}
