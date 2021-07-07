package com.bookshop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.dao.OrderDAO;
import com.bookshop.dao.OrderDetailDAO;

import com.bookshop.entity.Order;


@Controller
public class Backup {
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	@RequestMapping("/admin/backup/index")
	public String backup(Model model) {
		Order entity = new Order();
		
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/backup/index";
	}
	@RequestMapping(value = {"/admin/backup/backup","/index"})
	/*@RequestMapping("/admin/backup/backup")
	@RequestMapping("/hello")*/
	public String backup(RedirectAttributes model, HttpServletRequest request) {
		// Chỉnh đường dẫn tối ưu định vị vị trí file đầu ra
		try {
			String path = new File(".").getCanonicalPath();
			Stream<Path> walk = Files.walk(Paths.get(path+"\\src\\main\\webapp\\static\\images"));
            List<String> result = walk.filter(Files::isRegularFile)
                    .map(x -> x.toString()).collect(Collectors.toList());
            
            String nhap = new String();
            model.addAttribute("message", "Backup thành công tại "+path+"\\src\\main\\webapp\\static\\backup");
            String desFile = path+"\\src\\main\\webapp\\static\\backup\\"+request.getParameter("name")+".zip";
           String [] listFiles = new String[result.size()];
           for(int i=0;i<listFiles.length;i++	) {
        	   listFiles[i] = result.get(i);
           }
            ZipUtility u = new ZipUtility();
            u.zip(listFiles, desFile);
            System.out.println(listFiles);
        } catch (IOException e) {
            e.printStackTrace();
        }
		return "redirect:/admin/backup/index";
	}

	
	/*@RequestMapping("/admin/order/index")
	public String index(Model model) {
		Order entity = new Order();
		
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Order entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/order/index";
	}
	
	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/order/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/order/delete","/admin/order/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		if(id1 != null) {
			ddao.delete(id1);
		}else {
			ddao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/order/index";
	}*/
	



	
	
	
}
