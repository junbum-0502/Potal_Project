package com.jun.potal.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.user.dao.UserDao;
import com.jun.potal.vo.User;

@Service("adService")
@Repository
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao uDao;
	
	@Override
	public List<User> selectUser(User user) throws Exception {
		return uDao.selectUser(user);
	}
	
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
	
}
