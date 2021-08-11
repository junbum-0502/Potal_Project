package com.jun.potal.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.user.dao.UserDao;
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Message;
import com.jun.potal.vo.Schedule;
import com.jun.potal.vo.Scholarship;
import com.jun.potal.vo.User;

@Service("adService")
@Repository
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao uDao;
	
	@Override
	public List<User> login(User user) throws Exception { // 로그인
		return uDao.login(user);
	}
	
	@Override
	public List<User> findId(User user) throws Exception { // 아이디 찾기
		return uDao.findId(user);
	}
	
	@Override
	public List<User> findPwd(User user) throws Exception { // 비밀번호 찾기
		return uDao.findPwd(user);
	}
	
	@Override
	public int updatePwd(User user) throws Exception { // 비밀번호 변경
		return uDao.updatePwd(user);
	}
	
	@Override
	public int updateEmail(User user) throws Exception { // 이메일 변경
		return uDao.updateEmail(user);
	}
	
	@Override
	public int updatePhone(User user) throws Exception { // 핸드폰 번호 변경
		return uDao.updatePhone(user);
	}
	
	@Override
	public int sendMessage(Message msg) throws Exception { // 메세지 전송
		return uDao.sendMessage(msg);
	}
	
	@Override
	public List<Message> readMessage(Message msg) throws Exception { // 메세지 출력
		return uDao.readMessage(msg);
	}

	@Override
	public List<User> profileImg(User user) throws Exception { // 프로필 사진 업로드
		return uDao.profileImg(user);
	}
	
	@Override
	public List<User> tuition(User user) throws Exception { // 등록금 조회
		return uDao.tuition(user);
	}
	
	@Override
	public List<Scholarship> selectScholar(Scholarship sch) throws Exception { // 장학금 조회
		return uDao.selectSchoalr(sch);
	}
	
	@Override
	public List<Schedule> schedule(Schedule sch) throws Exception { // 시간표 조회
		return uDao.schedule(sch);
	}

}
