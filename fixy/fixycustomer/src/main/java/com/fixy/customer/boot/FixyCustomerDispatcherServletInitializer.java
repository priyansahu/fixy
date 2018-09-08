package com.fixy.customer.boot;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.fixy.customer.config.FixyCustomerWebMvcConfig;
import com.fixy.service.config.FixyRootConfig;

public class FixyCustomerDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		 return new Class<?>[] { FixyRootConfig.class };
	}
	

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { FixyCustomerWebMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "*.htm" };
	}

}
