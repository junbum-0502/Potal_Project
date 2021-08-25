package com.jun.potal.grade.service;

import java.util.List;

import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.User;

public interface GradeService {

	List<Grade> selectClassAll(Grade grade) throws Exception;
	
	List<Schedule> selectScoreAll(Schedule schedule) throws Exception;
	
	int insertScoreByIdx(Grade grade) throws Exception;
	
	List<Grade> selectClassUpdateAll(Grade grade) throws Exception; // 성적 수정 과목리스트
	
	int updateScoreByIdx(Grade grade) throws Exception;
	
	List<Grade> selectUpdateScoreByid(Grade grade) throws Exception;
	
	List<User> scoreUserInfo(User user) throws Exception; // 학생 정보 조회 (학생 개인정보)
	
	List<Grade> scoreUserInfoGrade(Grade grade) throws Exception; // 학생 정보 조회 (학생 성적정보)
	
	List<User> findStudentInfo(User user) throws Exception; // 과별 학생 리스트
	
	List<User> studentInfoGradeAllUser(User user) throws Exception; 
	
	List<Grade> studentInfoGradeAllGrade(Grade grade) throws Exception; // 전체성적 조회
	
	List<Schedule> studentInfoGradeAllSchedule(Schedule schedule) throws Exception; // 수강 목록 조회
	
	List<Grade> selectScoreById(Grade grade) throws Exception;
	
}
