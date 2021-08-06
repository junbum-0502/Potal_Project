package com.jun.potal.service.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.potal.service.service.ServiceService;
import com.jun.potal.vo.ServiceType;


@Controller
@RequestMapping("potal")
public class ServiceController {

	@Autowired
	private ServiceService ServiceService;
	
	@GetMapping("serviceList")
	public String selectServiceAll(Model model) throws Exception{
		
		List<ServiceType> sList = new ArrayList<ServiceType>();
		sList = ServiceService.selectServiceAll();
		model.addAttribute("sList",sList);
		
		return "service/serviceList";
		
	}
	
	
	
}
