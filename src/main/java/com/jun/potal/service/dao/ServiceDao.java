package com.jun.potal.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.ServiceHistory;
import com.jun.potal.vo.ServiceType;

@Repository
public class ServiceDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ServiceType> selectServiceAll() throws Exception{
		return sqlSession.selectList("ServiceType.selectServiceAll");
	}
	
	public int insertServiceHistory(ServiceHistory serviceHistory) throws Exception{
		return sqlSession.insert("ServiceHistory.insertServiceHistory",serviceHistory);
	}
	
	public List<ServiceHistory> selectServiceRequestAll(ServiceHistory serviceHistory) throws Exception{
		return sqlSession.selectList("ServiceHistory.selectServiceRequestAll",serviceHistory);
	}
	
	
}
