package com.bookshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.dao.ProductDAO;
import com.bookshop.dao.UserDAO;
import com.bookshop.entity.Product;
import com.bookshop.entity.User;



@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;

	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;
	

	// test avatar
	@GetMapping("")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "home";
	}
	


	@GetMapping("/about")
	public String edit1(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "home/about";
	}
	
	@GetMapping("/contact")
	public String edit2(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "home/contact";
	}
	
	@GetMapping("/feedback")
	public String avatar(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "home/feedback";
	}
	
	@GetMapping("/faq")
	public String avatar1(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "home/faq";
	}


	//
	
	
	@RequestMapping(value = {"", "/home"})
	public String index(Model model) {
		List<Product> list2 = pdao.findBySpecial(4);
		model.addAttribute("list", list2);
		List<Product> list3 = pdao.findBySpecial(0);
		model.addAttribute("list1", list3);
		return "home/index";
	}
	

	
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
	@RequestMapping("/product")
	public String product() {
		return "home";
	}
}
