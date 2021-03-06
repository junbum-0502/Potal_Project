package com.jun.potal.user.service;

import java.util.List;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Class;
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.Scholarship;
import com.jun.potal.vo.User;


public interface UserService {
	
	public List<User> login(User user) throws Exception; // 로그인
	
	public List<User> findId(User user) throws Exception; // 아이디 찾기
	
	public List<User> findPwd(User user) throws Exception; // 비밀번호 찾기
	
	public int updatePwd(User user) throws Exception; // 비밀번호 변경
	
	public int updateEmail(User user) throws Exception; // 이메일 변경
	
	public int updatePhone(User user) throws Exception; // 핸드폰 번호 변경

	public int sendMessage(Message msg) throws Exception; // 메세지 전송
	
	public List<Message> readMessage(Message msg) throws Exception; // 메세지 출력
	
	public List<User> profileImg(User user) throws Exception; // 프로필 사진 업로드
	
	public List<User> tuition(User user) throws Exception; // 등록금 조회

	public List<Scholarship> selectScholar(Scholarship sch) throws Exception; // 장학금 총액 조회
	
	public List<Schedule> schedule(Schedule sch) throws Exception; // 시간표 조회
	
	public List<Grade> grade(Grade grade) throws Exception; // 현학기 성적 조회
	
	public List<Grade> gradeAll(Grade grade) throws Exception; // 전학기 성적 조회
	
	public List<User> major(User user) throws Exception; // 학과 조회
	
	public List<Scholarship> semesterScholar(Scholarship sch) throws Exception; // 장학금 학기별 총액 조회
	
	public List<Scholarship> sch(Scholarship sch) throws Exception; // 장학금 학기별 조회
	
	public List<Scholarship> allSch(Scholarship sch) throws Exception; // 장학금 전체 조회
	
	public int schCount (Scholarship sch) throws Exception; // 장학금 학기별 수 조회
	
	public int allSchCount (Scholarship sch) throws Exception; // 장학금 전체 수 조회
	
	public List<Grade> gradeInfo(Grade grade) throws Exception; // 전체 성적 조회 페이지 정보(총 학점, 총 실점, 총 점)
	
	public List<Class> classInfo(Class cla) throws Exception; // 수업정보
	
	public List<User> typeChoose(int userId) throws Exception; // 메세지 교수 or 학생
	
	
}
