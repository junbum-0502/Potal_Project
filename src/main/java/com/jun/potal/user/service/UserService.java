package com.jun.potal.user.service;

import java.util.List;

import com.jun.potal.vo.User;


public interface UserService {
	
	public List<User> selectUser(User user) throws Exception;
	
	public List<User> login(User user) throws Exception; // 로그인
	
	public List<User> findId(User user) throws Exception; // 아이디 찾기
	
	public List<User> findPwd(User user) throws Exception; // 비밀번호 찾기
}
