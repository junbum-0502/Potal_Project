package com.jun.potal.user.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun.potal.user.service.UserService;
import com.jun.potal.vo.User;

@Controller
@RequestMapping("potal")
public class UserCtrl {
	
	@Autowired
	private UserService adService;
	
	@GetMapping("ready")
	public String ready() {
		
		return "user/ready";
	}
	
	@GetMapping("login")
	public String login() throws Exception {
	
		return "user/login";
	}
	
	@PostMapping("loginCheck")
	@ResponseBody
	public void loginCheck(User user, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		PrintWriter wr = response.getWriter();
		
		System.out.println("로그인 컨트롤러 진입");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		user.setUserId(Integer.valueOf(id));
		user.setPassword(pwd);
		System.out.println(user.getUserId());
		System.out.println(user.getPassword());
		
		HttpSession session = request.getSession();
		List<User> login = adService.login(user);
		if (login.equals("")) {
			System.out.println("login 실패");
			wr.println("<script type='text/javascript'>"); 
			wr.println("alert('아이디와 비밀번호를 확인해주세요.'); window.location = document.referrer;"); 
			wr.println("</script>");
			wr.flush();
		} else {
			System.out.println("login 상태  : " + login);
			session.setAttribute("login", login);
			wr.println("<script type='text/javascript'>"); 
			wr.println("window.location.href = '/potal';"); 
			wr.println("</script>");
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "index/index";
	}
	
}
