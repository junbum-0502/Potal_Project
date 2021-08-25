package com.jun.potal.grade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.User;

@Repository
public class GradeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Grade> selectClassAll(Grade grade) throws Exception{
		
		return sqlSession.selectList("Grade.selectClassAll",grade);
	}
	
	public List<Schedule> selectScoreAll(Schedule schedule) throws Exception{
		return sqlSession.selectList("Grade.selectScoreAll",schedule);
	}
	
	public int insertScoreByIdx(Grade grade) throws Exception{
		return sqlSession.insert("Grade.insertScoreByIdx",grade);
	}
	
	public List<Grade> selectScoreById(Grade grade) throws Exception{ 
		return sqlSession.selectList("Grade.selectScoreById",grade); 
	} 
	
	public List<Grade> selectClassUpdateAll(Grade grade) throws Exception{
		
		return sqlSession.selectList("Grade.selectClassUpdateAll",grade);
	}
	
	public int updateScoreByIdx(Grade grade) throws Exception{
		return sqlSession.update("Grade.updateScoreByIdx",grade);
	}
	
	public List<Grade> selectUpdateScoreByid(Grade grade) throws Exception{
		
		return sqlSession.selectList("Grade.selectUpdateScoreByid",grade);
	}
	
	public List<User> scoreUserInfo(User user) throws Exception{
		
		return sqlSession.selectList("Grade.scoreUserInfo",user);
	}
	
	public List<Grade> scoreUserInfoGrade(Grade grade) throws Exception{
		
		return sqlSession.selectList("Grade.scoreUserInfoGrade",grade);
	}
	
	public List<User> findStudentInfo(User user) throws Exception{
		
		return sqlSession.selectList("Grade.findStudentInfo",user);
	}
	
	public List<User> studentInfoGradeAllUser(User user) throws Exception{
	
		return sqlSession.selectList("Grade.studentInfoGradeAllUser",user);
	}
	
	public List<Grade> studentInfoGradeAllGrade(Grade grade) throws Exception{
		
		return sqlSession.selectList("Grade.studentInfoGradeAllGrade",grade);
	}
	
	public List<Schedule> studentInfoGradeAllSchedule(Schedule schedule) throws Exception{
		
		return sqlSession.selectList("Grade.studentInfoGradeAllSchedule",schedule);
	}
	
}
