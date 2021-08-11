package com.jun.potal.grade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.grade.dao.GradeDao;
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;

@Service
@Repository
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeDao gradeDao;
	
	@Override
	public List<Grade> selectClassAll(Grade grade) throws Exception {
		
		return gradeDao.selectClassAll(grade);
	}

	@Override
	public List<Schedule> selectScoreAll(Schedule schedule) throws Exception {
		
		return gradeDao.selectScoreAll(schedule);
	}

	/*
	 * @Override public List<Grade> selectScoreById(Grade grade) throws Exception {
	 * 
	 * return gradeDao.selectScoreById(grade); }
	 */

}
