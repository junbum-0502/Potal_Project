package com.jun.potal.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
	
	@GetMapping("potal")
	public String index() {
		return "index/index";
	}


}
