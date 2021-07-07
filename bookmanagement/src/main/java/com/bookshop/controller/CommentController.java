package com.bookshop.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.dao.CommentDAO;
import com.bookshop.dao.ProductDAO;
import com.bookshop.dao.UserDAO;
import com.bookshop.entity.Comment;
import com.bookshop.entity.User;

@Controller
public class CommentController {
	@Autowired
	CommentDAO comdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	UserDAO userdao;
	
	/*@RequestMapping("/product/detail/addCommentProduct/{id}")
	public String comment(@ModelAttribute("entity") Comment entity, @PathVariable("id") Integer id) {
		User user = userdao.findById("1");
		entity.setUser(user);
		entity.setProduct(pdao.findById(id));
		entity.setCommentedDate(new Date());
		System.out.println(entity);
		comdao.create(entity);
		 return "redirect:/product/detail/{id}";
	}*/

	@RequestMapping("/product/detail/addCommentProduct/{id}")
	public String comment(@ModelAttribute("entity") Comment entity, @PathVariable("id") Integer id) {
		
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/product/detail/{id}";
		}else {
		entity.setUser(user);
		entity.setProduct(pdao.findById(id));
		entity.setCommentedDate(new Date());
		System.out.println(entity);
		comdao.create(entity);
		return "redirect:/product/detail/{id}";
		}
	}
	
}
