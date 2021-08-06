package com.jun.potal.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.ServiceType;

@Repository
public class ServiceDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ServiceType> selectServiceAll() throws Exception{
		return sqlSession.selectList("ServiceType.selectServiceAll");
	}
	
	
}
