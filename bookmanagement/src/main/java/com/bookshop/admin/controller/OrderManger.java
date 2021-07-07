package com.bookshop.admin.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.dao.OrderDAO;
import com.bookshop.dao.OrderDetailDAO;
import com.bookshop.entity.Order;


@Controller
public class OrderManger {
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	@RequestMapping("/admin/order/index")
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
	}
	
	/*@RequestMapping("/admin/backup/index")
	public String backup(Model model) {
		Order entity = new Order();
		
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/backup/index";
	}
	@RequestMapping("/admin/backup/backup")
	public String backup(RedirectAttributes model) {
		model.addAttribute("message", "Thêm mới thành công!");
		try (Stream<Path> walk = Files.walk(Paths.get("C:\\Users\\aprod\\OneDrive\\Máy tính\\web\\bookmanagement\\src\\main\\webapp\\static\\images"))) {
            List<String> result = walk.filter(Files::isRegularFile)
                    .map(x -> x.toString()).collect(Collectors.toList());
            String desFile = "C:\\Users\\aprod\\OneDrive\\Máy tính\\web\\bookmanagement\\src\\main\\webapp\\static\\backup\\Backup.zip";
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
	}*/
}
