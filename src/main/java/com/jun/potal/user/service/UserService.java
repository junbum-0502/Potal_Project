package com.jun.potal.user.service;

import java.util.List;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.User;


public interface UserService {
	
	public List<User> login(User user) throws Exception; // 로그인
	
	public List<User> findId(User user) throws Exception; // 아이디 찾기
	
	public List<User> findPwd(User user) throws Exception; // 비밀번호 찾기
	
	public int updatePwd(User user) throws Exception; // 비밀번호 변경
	
	public int updateEmail(User user) throws Exception; // 이메일 변경
	
	public int updatePhone(User user) throws Exception; // 핸드폰 번호 변경

}
