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
}
