package com.jun.potal.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jun.potal.user.service.UserService;
import com.jun.potal.vo.User;

@Controller
@RequestMapping("potal")
public class UserCtrl {
	
	@Autowired
	private UserService adService;
	
	@GetMapping("selectUser")
	public String selectUser(Model model, User user) throws Exception {
		
		List<User> selectUser = adService.selectUser(user);
		System.out.println("selectUser : " + selectUser);
		model.addAttribute("selectUser", selectUser);
		
		return "index";
	}
	
}
