package com.jun.potal.grade.service;

import java.util.List;

import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Schedule;

public interface GradeService {

	List<Grade> selectClassAll(Grade grade) throws Exception;
	
	List<Schedule> selectScoreAll(Schedule schedule) throws Exception;
	
	/* List<Grade> selectScoreById(Grade grade) throws Exception; */
	
	int insertScoreByIdx(Grade grade) throws Exception;
	
}
