package com.jun.potal.service.service;

import java.util.List;

import com.jun.potal.vo.ServiceHistory;
import com.jun.potal.vo.ServiceType;

public interface ServiceService {

	public List<ServiceType> selectServiceAll() throws Exception;
	
	public int insertServiceHistory(ServiceHistory serviceHistory) throws Exception;
	
	public List<ServiceHistory> selectServiceRequestAll(ServiceHistory serviceHistory) throws Exception;
	
}
