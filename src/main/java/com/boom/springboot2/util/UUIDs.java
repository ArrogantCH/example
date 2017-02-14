package com.boom.springboot2.util;

import java.util.UUID;

public class UUIDs {

	public static String uuidAsHex(){
		return UUID.randomUUID().toString().replaceAll("-", "").toLowerCase();
	}
}
