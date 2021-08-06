package com.jun.potal.service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.service.dao.ServiceDao;
import com.jun.potal.vo.ServiceType;

@Service
@Repository
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private ServiceDao serviceDao;

	@Override
	public List<ServiceType> selectServiceAll() throws Exception {
		
		
		return serviceDao.selectServiceAll();
	}
	
}
