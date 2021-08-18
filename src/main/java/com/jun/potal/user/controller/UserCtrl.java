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
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Schedule;
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
	
	@GetMapping(value="tuitionIndex") // 등록금 페이지
	public String tuitionIndex() throws Exception {
		
		return "user/tuition";
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
	public String schedule(HttpServletRequest request, Schedule sch, Model model) throws Exception {
		
		System.out.println("시간표");
		String id = request.getParameter("userId");
		System.out.println("id : " + id);
		
		sch.setUserId(Integer.valueOf(id));
		List<Schedule> schedule = adService.schedule(sch);
		System.out.println("시간표 : " + schedule);
		
		model.addAttribute("schedule", schedule);
		
		return "user/schedule";
	}
	
	@GetMapping(value = "gradeIndex") // 성적 페이지
	public String gradeIndex(HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("성적 페이지");
		String id = request.getParameter("userId");
		String type = request.getParameter("type");
		System.out.println("id : " + id);
		System.out.println("type : " + type);
		if (type.equals("1")) { // 현학기
			System.out.println("현학기 조회");
			model.addAttribute("id", id);
			model.addAttribute("type", type);
		} else if (type.equals("2")) { // 전학기
			System.out.println("전학기 조회");
			model.addAttribute("id", id);
			model.addAttribute("type", type);
		} else {
			System.out.println("값 넘기기 오류");
		}
		
		return "user/grade";
	}
	
	@PostMapping(value = "grade", produces = "application/text; charset=utf8") // 성적 조회
	@ResponseBody
	public String grade(HttpServletRequest request, Grade grade) throws Exception {
		
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		System.out.println("id : " + id);
		System.out.println("type : " + type);
		System.out.println("date : " + date);
		grade.setUserId(Integer.valueOf(id));
		grade.setYearSemester(date);
		if (type.equals("1")) {
			System.out.println("현학기 성적 조회");
			List<Grade> gradeList = adService.grade(grade);
			System.out.println("현학기 성적 : " + gradeList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(gradeList);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (type.equals("2")) {
			System.out.println("전학기 성적 조회");
			List<Grade> gradeAllList = adService.gradeAll(grade);
			System.out.println("전학기 성적 : " + gradeAllList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(gradeAllList);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else {
			System.out.println("비로그인 상태");
			return "user/grade";
		}
	}
	
	@GetMapping(value = "classIndex")
	public String eClassIndex(HttpServletRequest request, Schedule sch, Model model) throws Exception {
		
		String id = request.getParameter("userId");
		System.out.println("id : " + id);
		sch.setUserId(Integer.valueOf(id));
		
		List<Schedule> eClass = adService.schedule(sch);
		System.out.println("수업 : " + eClass);
		model.addAttribute("eClass", eClass);
		
		return "user/classIndex";
	}
	
	@GetMapping(value = "class")
	public String eClass(HttpServletRequest request, Model model) throws Exception {
		
		String id = request.getParameter("userId");
		System.out.println("id : " + id);
		
		model.addAttribute("id", id);
		
		return "user/class";
	}
	
	@PostMapping(value = "major")
	@ResponseBody
	public List<User> major(HttpServletRequest request, User user, Model model) throws Exception {
		
		String major = request.getParameter("tuition");
		System.out.println("major : " + major);
		user.setmIdx(Integer.valueOf(major));
		
		List<User> major_info = adService.major(user);
		System.out.println("major_info : " + major_info);
		
		return major_info;
	}
	
	@PostMapping(value="semesterScholar") // 학기별 장학금 총액
	@ResponseBody
	public List<Scholarship> semesterScholar(HttpServletRequest request, Scholarship sch) throws Exception {
		
		String semester = request.getParameter("sValue");
		String id = request.getParameter("id");
		System.out.println("학기  : " + semester);
		System.out.println("아이디 : " + id);
		sch.setSemester(semester);
		sch.setUserId(Integer.valueOf(id));
		
		List<Scholarship> scholar = adService.semesterScholar(sch);
		System.out.println("장학금 : " + scholar);
		
		return scholar;
	}
	
	@GetMapping(value="schIndex")
	public String schIndex(HttpServletRequest request, Model model, Scholarship sch) throws Exception {
		
		String id = request.getParameter("userId");
		String name = request.getParameter("name");
		sch.setUserId(Integer.valueOf(id));
		int count = adService.allSchCount(sch);
		System.out.println("count : " + count);
		
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("count", count);
		
		return "user/scholarShip";
	}
	
	@PostMapping(value="sch")
	@ResponseBody
	public String sch(HttpServletRequest request, Scholarship sch) throws Exception { // 장학금 전체, 학기별 조회
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sValue = request.getParameter("sValue");
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("sValue : " + sValue);
		
		if (sValue.equals("-전체")) { // 전체
			sch.setUserId(Integer.valueOf(id));
			List<Scholarship> schList = adService.allSch(sch);
			System.out.println("schList : " + schList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(schList);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else { // 학기별
			sch.setUserId(Integer.valueOf(id));
			sch.setSemester(sValue);
			List<Scholarship> schList = adService.sch(sch);
			System.out.println("schList : " + schList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(schList);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		}
	}
	
	@PostMapping(value="schCount")
	@ResponseBody
	public int schCount(HttpServletRequest request, Scholarship sch) throws Exception { // 장학금 전체, 학기별 조회
		
		String id = request.getParameter("id");
		String sValue = request.getParameter("sValue");
		System.out.println("id : " + id);
		System.out.println("sValue : " + sValue);
		
		if (sValue.equals("-전체")) { // 전체
			sch.setUserId(Integer.valueOf(id));
			int schCount = adService.allSchCount(sch);
			System.out.println("schCount : " + schCount);
			return schCount;
		} else { // 학기별
			sch.setUserId(Integer.valueOf(id));
			sch.setSemester(sValue);
			int schCount = adService.schCount(sch);
			System.out.println("schCount : " + schCount);
			return schCount;
		}
	}
}
