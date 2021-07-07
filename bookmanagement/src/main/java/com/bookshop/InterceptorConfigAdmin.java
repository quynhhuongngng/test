package com.bookshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bookshop.interceptor.Authorizelnterceptor;
import com.bookshop.interceptor.AuthorizelnterceptorAdmin;
import com.bookshop.interceptor.Sharelnterceptor;

@Configuration
public class InterceptorConfigAdmin implements WebMvcConfigurer {
	@Autowired
	Sharelnterceptor share;

	@Autowired
	AuthorizelnterceptorAdmin auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(share).addPathPatterns("/**");

		registry.addInterceptor(auth).addPathPatterns(
				"/admin/home/index", 
				"/admin/backup/index", //nhet session login 
				"/admin/product/index", 
				"/admin/category/index", 
				"/admin/inventory/index",
				"/admin/profile",
				"/admin/customer/index",
				"/admin/order/index", 
				"/admin/report/inventory", 
				"/admin/revenue/category",
				"/admin/revenue/customer",
				"/admin/revenue/month",
				"/admin/revenue/quarter",
				"/admin/change",
				"/admin/revenue/year",
				"/admin/report/revenue-by-category",
				"/admin/report/revenue-by-customer", 
				"/admin/report/revenue-by-month",
				"/admin/report/revenue-by-quarter", 
				"/admin/report/revenue-by-year");
	}
}
