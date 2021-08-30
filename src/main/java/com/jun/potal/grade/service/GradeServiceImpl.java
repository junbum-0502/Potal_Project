package com.jun.potal.grade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.grade.dao.GradeDao;
import com.jun.potal.vo.Grade;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.User;

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

	// 성적입력
	@Override
	public int insertScoreByIdx(Grade grade) throws Exception {
		return gradeDao.insertScoreByIdx(grade);
	}

	@Override
	public List<Grade> selectClassUpdateAll(Grade grade) throws Exception {
		
		return gradeDao.selectClassUpdateAll(grade);
	}

	@Override
	public int updateScoreByIdx(Grade grade) throws Exception {
		return gradeDao.updateScoreByIdx(grade);
	}

	@Override
	public List<Grade> selectUpdateScoreByid(Grade grade) throws Exception {
		
		return gradeDao.selectUpdateScoreByid(grade);
	}

	@Override
	public List<User> scoreUserInfo(User user) throws Exception {
		return gradeDao.scoreUserInfo(user);
	}

	@Override
	public List<Grade> scoreUserInfoGrade(Grade grade) throws Exception {
		return gradeDao.scoreUserInfoGrade(grade);
	}

	@Override
	public List<User> findStudentInfo(User user) throws Exception {
		return gradeDao.findStudentInfo(user);
	}

	@Override
	public List<User> studentInfoGradeAllUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.studentInfoGradeAllUser(user);
	}

	@Override
	public List<Grade> studentInfoGradeAllGrade(Grade grade) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.studentInfoGradeAllGrade(grade);
	}

	@Override
	public List<Schedule> studentInfoGradeAllSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.studentInfoGradeAllSchedule(schedule);
	}

	@Override
	public List<Grade> selectScoreById(Grade grade) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.selectScoreById(grade);
	}

	@Override 
	public int sendMessagePtoU(Message msg) throws Exception {
		// 메세지 보내기
		return gradeDao.sendMessagePtoU(msg);
	}

	@Override
	public List<Message> readMessagePtoU(Message msg) throws Exception {
		 // 메세지 읽기
		return gradeDao.readMessagePtoU(msg); 
	}


}
