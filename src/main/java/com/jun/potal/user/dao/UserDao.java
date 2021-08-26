package com.jun.potal.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Class;
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.Scholarship;
import com.jun.potal.vo.User;

@Repository("uDao")
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<User> login(User user) throws Exception { // 로그인
		return sqlSession.selectList("User.login", user);
	}
	
	public List<User> findId(User user) throws Exception { // 아이디 찾기
		return sqlSession.selectList("User.findId", user);
	}
	
	public List<User> findPwd(User user) throws Exception { // 비밀번호 찾기
		return sqlSession.selectList("User.findPwd", user);
	}
	
	public int updatePwd(User user) throws Exception { // 비밀번호 변경
		return sqlSession.update("User.updatePwd", user);
	}
	
	public int updateEmail(User user) throws Exception { // 이메일 변경
		return sqlSession.update("User.updateEmail", user);
	}
	
	public int updatePhone(User user) throws Exception { // 핸드폰 번호 변경
		return sqlSession.update("User.updatePhone", user);
	}
	
	public int sendMessage(Message msg) throws Exception { // 메세지 전송
		return sqlSession.insert("User.sendMessage", msg);
	}
	
	public List<Message> readMessage(Message msg) throws Exception { // 메세지 출력
		return sqlSession.selectList("User.readMessage", msg);
	}
	
	public List<User> profileImg(User user) throws Exception { // 프로필 사진 업로드
		return sqlSession.selectList("User.profileImg", user);
	}
	
	public List<User> tuition(User user) throws Exception { // 등록금 조회
		return sqlSession.selectList("User.tuition", user);
	}
	
	public List<Scholarship> selectSchoalr(Scholarship sch) throws Exception { // 장학금 총액 조회
		return sqlSession.selectList("User.selectScholar", sch); 
	}
	
	public List<Schedule> schedule(Schedule sch) throws Exception { // 시간표 조회
		return sqlSession.selectList("User.schedule", sch);
	}
	
	public List<Grade> grade(Grade grade) throws Exception { // 현학기 성적 조회
		return sqlSession.selectList("User.grade", grade);
	}
	
	public List<Grade> gradeAll(Grade grade) throws Exception { // 전학기 성적 조회
		return sqlSession.selectList("User.gradeAll", grade);
	}
	
	public List<User> major(User user) throws Exception { // 학과 조회
		return sqlSession.selectList("User.major", user);
	}
	
	public List<Scholarship> semesterScholar(Scholarship sch) throws Exception { // 장학금 학기별 총액 조회
		return sqlSession.selectList("User.semesterScholar", sch);
	}
	
	public List<Scholarship> sch(Scholarship sch) throws Exception { // 장학금 학기별 조회
		return sqlSession.selectList("User.sch", sch);
	}
	
	public List<Scholarship> allSch(Scholarship sch) throws Exception { // 장학금 전체 조회
		return sqlSession.selectList("User.allSch", sch);
	}
	
	public int schCount(Scholarship sch) throws Exception { // 장학금 학기별 수 조회
		return sqlSession.selectOne("User.schCount", sch);
	}
	
	public int allSchCount(Scholarship sch) throws Exception { // 장학금 전체 수 조회
		return sqlSession.selectOne("User.allSchCount", sch);
	}
	
	public List<Grade> gradeInfo(Grade grade) throws Exception { // 전체 성적 조회 페이지 정보(총 학점, 총 실점, 총 점)
		return sqlSession.selectList("User.gradeInfo", grade);
	}

	
	public List<Class> classInfo(Class cla) throws Exception { // 수업정보
		return sqlSession.selectList("User.classInfo", cla);
	}
	
	public List<User> typeChoose(int userId) throws Exception { // 메세지 교수 or 학생
		return sqlSession.selectList("User.typeChoose", userId);
	}
	
	
	
}
