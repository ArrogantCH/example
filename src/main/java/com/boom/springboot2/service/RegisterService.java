package com.boom.springboot2.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.boom.springboot2.entity.Register;
import com.boom.springboot2.entity.User;
import com.boom.springboot2.repository.RegisterRepository;
import com.boom.springboot2.repository.UserRepository;
import com.boom.springboot2.util.Result;
import com.boom.springboot2.util.UUIDs;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Service
public class RegisterService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger LOG = LoggerFactory.getLogger(RegisterService.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private RegisterRepository registerRepository;

	public Result<User> registVali(String phone) {
		User user = userRepository.findByPhone(phone);
		Register register = new Register();
		register.setUser(user);
		register.setStatus("NO");
		String activeID =UUIDs.uuidAsHex();
		register.setActiveId(activeID);
		registerRepository.saveAndFlush(register);
		sendRegisterMail(user.getId(), activeID, user.getUserName(),
				user.getEmail());
		return Result.createForOk(user);
	}

	public Result<Register> mailVail(String userId, String Verification) {
		Register register = registerRepository.findByUserId(userId);
		if (!Verification.equals(register.getActiveId())) {
			return Result.create("VERIFICATION_FALIE", "验证失败");
		}
		register.setStatus("OK");
		registerRepository.saveAndFlush(register);	
		return Result.createForOk(register);
	}

	public void sendRegisterMail(String userId, String activeID,
			String userName, String email) {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(mimeMessage, true);
			helper.setFrom("2315423415@qq.com");
			helper.setTo(email);
			helper.setSubject("注册激活邮件");

			String url = "http://192.168.0.20:9090/mail/register?userId="
					+ userId + "&Verification=" + activeID;
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("username", userName);
			model.put("url", url);

			Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
			cfg.setClassForTemplateLoading(this.getClass(), "/templates");
			Template template = cfg.getTemplate("mail.ftl");
			String html = FreeMarkerTemplateUtils.processTemplateIntoString(
					template, model);
			helper.setText(html, true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (TemplateNotFoundException e) {
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}

	}
}
