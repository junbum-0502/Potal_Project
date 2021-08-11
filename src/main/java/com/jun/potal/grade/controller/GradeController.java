package com.jun.potal.grade.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		/*
		 * String id = request.getParameter("pid"); int pid = Integer.parseInt(id);
		 * model.addAttribute("pid",pid);
		 */
		return "grade/putScore";
	}

	@GetMapping("updateScore")
	public String updateScoreByNameAndIdx(HttpServletRequest request) throws Exception {

		String name = request.getParameter("name");
		System.out.println(name);
		
		String score = request.getParameter("score");
		int iscore = Integer.parseInt(score);
		System.out.println("점수 : "+iscore);


		return "redirect:/potal";
	}

}
