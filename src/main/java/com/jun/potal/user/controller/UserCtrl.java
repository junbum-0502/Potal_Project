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
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Scholarship;
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
	
	@GetMapping("myPageIndex") // 마이페이지 연결
	public String myPageIndex() {
		System.out.println("마이페이지 진입!");
		return "user/myPage";
	}
	
	@PostMapping("updateInfo") // 회원 정보 변경
	public String updateInfo(HttpServletRequest request, User user, Model model) throws Exception {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pwd);
		System.out.println("이메일 : " + email);
		System.out.println("핸드폰 번호 : " + phone);
		
		if (pwd != null) { // 비밀번호 변경
			user.setUserId(Integer.valueOf(id));
			user.setPassword(pwd);
			int updatePwd = adService.updatePwd(user);
			System.out.println("변경 상태 : " + updatePwd);
			if (updatePwd != 0) {
				System.out.println("변경 완료");
				model.addAttribute("updatePwd", updatePwd);
			} else {
				System.out.println("변경 실패");
			}
		} else if (email != null) { // 이메일 변경
			user.setUserId(Integer.valueOf(id));
			user.setEmail(email);
			int updateEmail = adService.updateEmail(user);
			System.out.println("변경 상태 : " + updateEmail);
			if (updateEmail != 0) {
				System.out.println("변경 완료");
				model.addAttribute("updateEmail", updateEmail);
			} else {
				System.out.println("변경 실패");
			}
		} else if (phone != null) { // 핸드폰 번호 변경
			user.setUserId(Integer.valueOf(id));
			user.setPhone(phone);
			int updatePhone = adService.updatePhone(user);
			System.out.println("변경 상태 : " + updatePhone);
			if (updatePhone != 0) {
				System.out.println("변경 완료");
				model.addAttribute("updatePhone", updatePhone);
			} else {
				System.out.println("변경 실패");
			}
		}
		
		return "user/myPage";
	}
	
	@GetMapping("message") // 메세지 창 진입
	public String message() {
		return "user/message";
	}
	
	@PostMapping(value = "readMessage", produces = "application/text; charset=utf8") // 메세지 출력
	@ResponseBody
	public String readMessage(HttpServletRequest request, Message msg) throws Exception {
		
		String id = request.getParameter("id");
		System.out.println("id는 : " + id);
		msg.setUserId(Integer.valueOf(id));
		
		// 메세지 출력
		List<Message> list = adService.readMessage(msg);
		System.out.println("메세지 리스트 : " + list);
		Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput = gson.toJson(list);
		System.out.println("jsonOutput : "+ jsonOutput);
		return jsonOutput;
	}
	
	@PostMapping(value = "sendMessage", produces = "application/text; charset=utf8") // 메세지 보내기
	@ResponseBody
	public String sendMessage(HttpServletRequest request, Message msg) throws Exception {
		
			String id = request.getParameter("id");
			String content = request.getParameter("content");
			System.out.println("id는 : " + id);
			System.out.println("content는 : " + content);
			msg.setUserId(Integer.valueOf(id));
			msg.setContent(content);
			// 메세지 전송
			int Message = adService.sendMessage(msg);
			System.out.println("메세지 전송 상태 : " + Message);
			
			// 메세지 출력
			List<Message> list = adService.readMessage(msg);
			System.out.println("메세지 리스트 : " + list);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(list);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
	}
	
	@PostMapping(value = "profileImg") // 프로필 사진
	@ResponseBody
	public List<User> profileImg(HttpServletRequest request, User user) throws Exception { // 프로필 사진 업로드
		
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		user.setUserId(Integer.valueOf(id));
		
		List<User> img = adService.profileImg(user);
		System.out.println("img : " + img);
		
		return img;
	}
	
	@PostMapping(value="tuition") // 등록금
	@ResponseBody
	public List<User> tuition(HttpServletRequest request, User user, Model model) throws Exception { // 등록금 조회
		
		String major = request.getParameter("tuition");
		user.setmIdx(Integer.valueOf(major));
		
		List<User> tuition = adService.tuition(user);
		System.out.println("tuition : " + tuition);
		model.addAttribute("tuition", tuition);
		
		return tuition;
	}
	
	@PostMapping(value="scholarship") // 장학금
	@ResponseBody
	public List<Scholarship> selectScholar(HttpServletRequest request, Scholarship sch) throws Exception { // 장학금 조회
		
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		sch.setUserId(Integer.valueOf(id));
		System.out.println(sch.getUserId());
		
		List<Scholarship> selectScholar = adService.selectScholar(sch);
		System.out.println("selectScholar : " + selectScholar);
		
		return selectScholar;
		
	}
	
	@PostMapping(value = "schedule") // 시간표 페이지
	public String schedule() {
		
		System.out.println("시간표");
		
		
		return "user/schedule";
	}
}
