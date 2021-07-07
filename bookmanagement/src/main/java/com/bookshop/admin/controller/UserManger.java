package com.bookshop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.dao.UserDAO;
import com.bookshop.entity.User;

@Controller
public class UserManger {
	@Autowired
	UserDAO dao;

	@Autowired
	ServletContext app;
	
	@RequestMapping("/admin/customer/createCustomer")
	public String createCustomer(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/createCustomer";
	}
	
	@RequestMapping("/admin/customer/editCustomer")
	public String editCustomer(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/editCustomer";
	}

	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	
	// button edit listCustomer. !! /admin/customer/{id}
	@RequestMapping("/admin/customer/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		User entity = dao.findByUsername(username);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/editCustomer";
	}

	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model, 
			@Validated @ModelAttribute("entity") User entity,
			@RequestParam("password") String pw,
			@RequestParam("photo_file") MultipartFile file) 
			throws IllegalStateException, IOException {

		User user2 = dao.findByUsername(entity.getUsername());
		
		if (user2 != null) {
			model.addAttribute("message","Tên đăng nhập đã tồn tại!");
			return "redirect:/admin/customer/index";
		}

		if (file.isEmpty()) {
			entity.setPhoto("user.png");
		} else {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/admin/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		entity.setPassword(Base64.getEncoder().encodeToString(pw.getBytes()));
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/customer/index";
	}
	
	// set redirect update
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") User entity,@RequestParam("username") String username,
			@RequestParam("password") String pw,@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
			
		User user = dao.findByUsername(username);
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/admin/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		
		if(!pw.equals(user.getPassword())) {
			//String newpw = request.getParameter("changepw");
			entity.setPassword(Base64.getEncoder().encodeToString(entity.getPassword().getBytes()));
		}
		
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/customer/index";

	}

	@RequestMapping(value = { "/admin/customer/delete", "/admin/customer/delete/{id}" })
	public String delete(RedirectAttributes model, @RequestParam(value = "id", required = false) String id1,
			@PathVariable(value = "id", required = false) String id2) {
		if (id1 != null) {
			dao.delete(id1);
		} else {
			dao.delete(id2);
		}

		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/customer/index";
	}

	int pageSize = 8;

	@ResponseBody
	@RequestMapping("/pager/customer/page-count")
	public long pageCount() {

		return dao.getPageCount(pageSize);
	}

	@ResponseBody
	@RequestMapping("/pager/customer/page/{pageNo}")
	public List<User> getPage(@PathVariable("pageNo") int pageNo) {
		List<User> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}