package com.jun.potal.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.User;

@Repository("uDao")
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<User> selectUser(User user) throws Exception {
		return sqlSession.selectList("User.selectUser", user);
	}
	
	public List<User> login(User user) throws Exception { // 로그인
		return sqlSession.selectList("User.login", user);
	}
	
	public List<User> findId(User user) throws Exception { // 아이디 찾기
		return sqlSession.selectList("User.findId", user);
	}
	
	public List<User> findPwd(User user) throws Exception { // 비밀번호 찾기
		return sqlSession.selectList("User.findPwd", user);
	}
}
