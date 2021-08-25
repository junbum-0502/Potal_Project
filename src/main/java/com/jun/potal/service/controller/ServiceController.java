package com.jun.potal.service.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.potal.service.service.ServiceService;
import com.jun.potal.vo.ServiceHistory;
import com.jun.potal.vo.ServiceType;
import com.jun.potal.vo.User;


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
	
	@GetMapping("serviceDetail")
	public String ServiceDetail(HttpServletRequest request) throws Exception{
		
		String type = request.getParameter("stIdx");
		/* System.out.println(type); */
		int num = Integer.parseInt(type);
		
		if(num == 1001) {
			return "service/normalService";
		}else if(num == 1002) {
			return "service/milService";
		}else if(num == 1003) {
			return "service/jobService";
		}else if(num == 1004) {
			return "service/reService";
		}else {
			return "service/abService";
		}
	}

	// 민원신청
	@GetMapping("listCheck")
	public String insertServiceHistory(HttpServletRequest request, ServiceHistory serviceHistory, User user,Model model) throws Exception{
	
		String id = request.getParameter("id");
		/* System.out.println(id); */
		int uId = Integer.parseInt(id);
		serviceHistory.setUserId(uId);
		
		String idx = request.getParameter("stIdx");
		/* System.out.println(idx); */
		int stIdx = Integer.parseInt(idx);
		serviceHistory.setStIdx(stIdx);
		
		ServiceService.insertServiceHistory(serviceHistory);
		
		return "redirect:/potal/reqService?userId="+id;
	}
	
	// 민원신청내역
	@GetMapping("reqService")
	public String showPage(HttpServletRequest request, ServiceHistory serviceHistory, Model model) throws Exception{
		
		String userId = request.getParameter("userId");
		System.out.println("id가 뭔가요?? : "+userId);
		int uid = Integer.parseInt(userId);
		serviceHistory.setUserId(uid);
		
		List<ServiceHistory> shList = new ArrayList<ServiceHistory>();
		shList = ServiceService.selectServiceRequestAll(serviceHistory);
		model.addAttribute("shList",shList);
		System.out.println("내역 : "+shList);
		return "service/serviceHistory";
	}
	
	
	
}
