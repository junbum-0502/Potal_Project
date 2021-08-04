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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jun.potal.user.service.UserService;
import com.jun.potal.vo.User;

@Controller
@RequestMapping("potal")
public class UserCtrl {
	
	@Autowired
	private UserService adService;
	
	@GetMapping("login") // 로그인 페이지 연결
	public String login() throws Exception {
	
		return "user/login";
	}
	
	@PostMapping("loginCheck") // 로그인
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
	
	@GetMapping("logout") // 로그아웃
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "index/index";
	}
	
	@GetMapping("findIndex") // 아이디, 비밀번호 찾기 페이지 연결
	public String findIndex(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		if (id == null) { // 비밀번호 찾기
			model.addAttribute("pwd", pwd);
		} else if (pwd == null) { // 아이디 찾기
			model.addAttribute("id", id);
		}
		
		return "user/findInfo";
	}
	
	@PostMapping("findInfo")
	@ResponseBody
	public String findInfo(HttpServletRequest request, User user, Model model) throws Exception {
		
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		System.out.println("birth : " + birth);
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("phone : " + phone);
		
		if (phone == null) { // 아이디 찾기
			user.setName(name);
			user.setBirth(birth);
			List<User> findId = adService.findId(user);
			System.out.println("findId : " + findId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(findId);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (birth == null) { // 비밀번호 찾기
			user.setUserId(Integer.valueOf(id));
			user.setName(name);
			user.setPhone(phone);
			List<User> findPwd = adService.findPwd(user);
			System.out.println("findPwd : " + findPwd);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(findPwd);
			System.out.println("jsonOutput : "+ jsonOutput);	
			return jsonOutput;
		}
		
		return "user/findInfo";
	}
	
}
