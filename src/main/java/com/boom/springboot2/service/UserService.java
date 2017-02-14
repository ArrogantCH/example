package com.boom.springboot2.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.boom.springboot2.entity.Register;
import com.boom.springboot2.entity.User;
import com.boom.springboot2.repository.RegisterRepository;
import com.boom.springboot2.repository.UserRepository;
import com.boom.springboot2.util.Digests;
import com.boom.springboot2.util.Result;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RegisterRepository registerRepository;

	public Result<User> saveUser(String userName, String password,
			String email, String phone) {
		User user = new User();
		user.setUserName(userName);
		user.setPasswd(Digests.md5Digest(password));
		user.setEmail(email);
		user.setStatus("ok");
		user.setPhone(phone);
		userRepository.saveAndFlush(user);
		return Result.createForOk(user);
	}

	public Page<User> findUserPage(int pageIndex, int pageSize) {
		Pageable p = new PageRequest(pageIndex, pageSize);
		return userRepository.findAll(p);
	}

	public Result<User> loginVerification(String userName, String password) {
		User user = userRepository.findByUserName(userName);
		String pass = Digests.md5Digest(password);
		if (!user.getPasswd().equals(pass)) {
			System.err.println("密码不同");
			return Result.create("PASSWORD_ERROR", "密码错误");
		}
		Register register = registerRepository.findByUserId(user.getId());
		if (!"OK".equals(register.getStatus())) {
			return Result.create("NO_ACTIVATION", "帐号没有激活");
		}
		return Result.createForOk(user);
	}

	public void fileUpload(List<MultipartFile> files, String url) {
		BufferedOutputStream bos = null;
		try {
			if (!files.isEmpty()) {
				for (MultipartFile multipartFile : files) {
					if (!multipartFile.isEmpty()) {
						byte[] b = multipartFile.getBytes();
						bos = new BufferedOutputStream(new FileOutputStream(url
								+ "/"+multipartFile.getOriginalFilename()));
						bos.write(b);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bos != null) {
					bos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
