package com.jun.potal.grade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;

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
	
	/*
	 * public List<Grade> selectScoreById(Grade grade) throws Exception{ return
	 * sqlSession.selectList("Grade.selectScoreById",grade); }
	 */
	
}
