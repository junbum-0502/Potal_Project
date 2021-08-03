package com.jun.potal.user.service;

import java.util.List;

import com.jun.potal.vo.User;


public interface UserService {
	
	public List<User> selectUser(User user) throws Exception;
	
}
