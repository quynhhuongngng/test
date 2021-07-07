package com.bookshop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import javax.mail.MessagingException;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.bean.MailInfo;
import com.bookshop.dao.UserDAO;
import com.bookshop.entity.User;
import com.bookshop.service.CookieService;
import com.bookshop.service.MailService;

@Controller
public class AccountAdminController {

	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	CookieService cookie;

	@Autowired
	ServletContext app;
	
	@Autowired
	MailService mailer;	
	
	@Autowired
	HttpServletRequest request;

	@GetMapping("/admin/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "admin/login/login";
	}
	
	@GetMapping("/admin")
	public String login1(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "admin/login/login";
	}
	
	
	@PostMapping("/admin/login")
	public String login(Model model,
			@RequestParam("username") String username,
			@RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		User user = dao.findByUsername(username);
	
		String encodepw = Base64.getEncoder().encodeToString(pw.getBytes());
		if (user == null) {
			model.addAttribute("message", "Sai tài khoản hoặc mật khẩu");
		} else if (!encodepw.equals(user.getPassword())) {
			model.addAttribute("message", "Sai mật khẩu");
			
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Tài khoản chưa được kích hoạt!");
		}else if (!user.getAdmin()) {
			model.addAttribute("message", "Không có quyền!");
			
		} else {// thanh cong
			model.addAttribute("message", "Login successfully!");
			session.setAttribute("user", user);
			// ghi nho tk
			if (rm == true) {
				cookie.create("userid", user.getUsername(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				cookie.delete("pass");
			}
			//Quay lai trang bao ve(neu co)
			String backUrl = (String) session.getAttribute("back-url-admin");
			if(backUrl != null) {
				return "redirect:" + backUrl;
			}
			return "redirect:/admin/home/index";
		}
		return "admin/login/login";
	}


	
	@RequestMapping("/admin/logout")
	public String logout(Model model) {
		session.removeAttribute("user");
		return "redirect:/admin/login";
	}
	
	@GetMapping("/admin/account/activate/{id}")
	public String activate(Model model,@PathVariable("username") String username) {
		User user = dao.findByUsername(username);
		user.setActivated(true);
		dao.update(user);
		
		return "redirect:/admin/account/login";
	}
	
	@GetMapping("/admin/profile")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "admin/account/edit";
	}

	@PostMapping("/admin/profile")
	public String edit(Model model, @ModelAttribute("form") User user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
			return "admin/account/edit";
		} 
		if(!file.isEmpty()) {
			String dir = app.getRealPath("static/images/admin");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		dao.update(user);
		session.setAttribute("user", user);

		model.addAttribute("message", "Cập nhật thành công!");

		return "admin/account/edit";
	}
	
	@GetMapping("/admin/change")
	public String change(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "admin/account/change";
	}

	@PostMapping("/admin/change")
	public String change(Model model, 
			@ModelAttribute("form") User users,
			@RequestParam("username") String username, 
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1, 
			@RequestParam("pw2") String pw2) {
		String encodepw = Base64.getEncoder().encodeToString(pw.getBytes());

		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "Xác nhận mật khẩu không trùng khớp!");
		} else {
			User user = dao.findByUsername(username);
			if (user == null) {
				model.addAttribute("message", "Sai tài khoản!");
			} else if (!encodepw.equals(user.getPassword())) {
				model.addAttribute("message", "Mật khẩu hiện tại không đúng!");
			} else {
				user.setPassword(Base64.getEncoder().encodeToString(pw1.getBytes()));
				dao.update(user);
				model.addAttribute("message", "Thay đổi mật khẩu thành công!");
			}
		}
		return "admin/account/change";
	}
	

	
}








