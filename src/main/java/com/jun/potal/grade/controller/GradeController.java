package com.jun.potal.grade.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.potal.grade.service.GradeService;
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;

@Controller
@RequestMapping("potal")
public class GradeController {

	@Autowired
	private GradeService gradeService;

	// 과목별로 나누기
	@GetMapping("gradeAll")
	public String selectClassAll(HttpServletRequest request, Model model, Grade grade) throws Exception {

		String uId = request.getParameter("pId");
		int userId = Integer.parseInt(uId);
		/* System.out.println("아디??"+userId); */
		grade.setProId(userId);

		List<Grade> gList = new ArrayList<Grade>();
		gList = gradeService.selectClassAll(grade);
		model.addAttribute("gList", gList);

		return "grade/showGradeAll";
	}

	// 과목별 학생 성적 조회
	@GetMapping("titleByGrade")
	public String selectScoreAll(HttpServletRequest request, Model model, Schedule schedule, Grade grade) throws Exception {

		String uId = request.getParameter("pId");
		int userId = Integer.parseInt(uId);
		/* System.out.println(userId); */
		schedule.setProId(userId);
		grade.setProId(userId);

		String cidx = request.getParameter("cIdx");
		int idx = Integer.parseInt(cidx);
		/* System.out.println(idx); */
		schedule.setcIdx(idx);
		grade.setcIdx(idx);

		List<Schedule> sList = new ArrayList<Schedule>();
		sList = gradeService.selectScoreAll(schedule);
		
		/*
		 * List<Grade> aList = new ArrayList<Grade>(); aList =
		 * gradeService.selectScoreById(grade);
		 */
		
		model.addAttribute("sList", sList);
		/* model.addAttribute("aList", aList); */

		return "grade/showScoreAll";
	}

	// 학생 성적 수정 페이지 이동
	@GetMapping("putScore")
	public String updatePageMove(HttpServletRequest request, Model model) throws Exception {

		String name = request.getParameter("name");
		model.addAttribute("name", name);
		String idx = request.getParameter("cIdx");
		int cIdx = Integer.parseInt(idx);
		model.addAttribute("idx", cIdx);
		String id = request.getParameter("userId");
		int uid = Integer.parseInt(id);
		model.addAttribute("uid",uid);
		String proid = request.getParameter("pid"); 
		int pid = Integer.parseInt(proid);
		model.addAttribute("pid",pid);
		 
		return "grade/putScore";
	}
	
	// 성적입력
	@PostMapping("updateScore")
	public String insertScoreByIdx(HttpServletRequest request,Grade grade) throws Exception {

		String idx = request.getParameter("idx"); // 과목번호
		int cIdx = Integer.parseInt(idx);
		grade.setcIdx(cIdx);
		
		String uid = request.getParameter("uid"); // 학생아이디	
		int userId = Integer.parseInt(uid);
		grade.setUserId(userId);
		
		String mid = request.getParameter("mid"); // 중간성적
		int midScore = Integer.parseInt(mid);
		grade.setMidScore(midScore);
		
		String finalScore = request.getParameter("final"); // 기말성적
		int finScore = Integer.parseInt(finalScore);
		grade.setFinalScore(finScore);
		
		String score = request.getParameter("score"); // 총점
		int sumScore = Integer.parseInt(score);
		grade.setScore(sumScore);
		
		String gradeNum = request.getParameter("credit"); // 학점 ex) 4	
		double credit = Double.parseDouble(gradeNum);
		grade.setCredit(credit);
		
		String pid = request.getParameter("pid"); // 교수아이디
		int proId = Integer.parseInt(pid);
		grade.setProId(proId);	
		
		String gradeAlpha = request.getParameter("grade");	// 학점 ex) A+
		grade.setGrade(gradeAlpha);
		
		String name = request.getParameter("name"); // 학생이름
		grade.setName(name);
		
		String semester = request.getParameter("semester"); // 수강 학기
		grade.setYearSemester(semester);
		
		gradeService.insertScoreByIdx(grade);
		
		
		  System.out.println("교수번호" + pid);
		  System.out.println("과목번호 "+idx+"학생번호 "+uid+"학생이름 "+name+"중간점수 "+mid+"기말점수 "
		  +finalScore+"총합점수 "+score+"학점1 "+credit+"학점2 "+gradeAlpha
		  +"수강학기 : "+semester);
		 

		return "redirect:/potal";
	}

}
