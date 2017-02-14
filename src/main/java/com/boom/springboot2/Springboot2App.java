package com.boom.springboot2;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.util.StringUtils;

@SpringBootApplication
public class Springboot2App {

	private static final Logger LOG = LoggerFactory.getLogger(Springboot2App.class);
	
	public static void main(String[] args) {
		SpringApplication.run(Springboot2App.class, args);
	}
	
	@Bean
	public ServletContextListener servletContextListener() {
		return new ServletContextListener() {
			@Override
			public void contextInitialized(ServletContextEvent event) {
				ServletContext sc = event.getServletContext();
				String path = sc.getContextPath();
				if (StringUtils.isEmpty(path) || path.equals("/")) {
					path = "";
				}
				sc.setAttribute("ctx", path);
				sc.setAttribute("assets", path + "/assets");
				LOG.info("Servlet context initialized.");
			}

			@Override
			public void contextDestroyed(ServletContextEvent event) {
				LOG.info("Servlet context destroyed.");
			}
		};
	}
}
