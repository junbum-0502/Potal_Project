package com.jun.potal.book.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.potal.book.model.service.BookService;
import com.jun.potal.vo.Book;

@Controller
@RequestMapping("potal")
public class bookController {
	
	@Autowired
	private  BookService bookService;

	@GetMapping("book")
	public String index(Model model) throws Exception{
		List<Book> bList = new ArrayList<Book>();
		/* Map<String,Object> commandMap = new HashMap<String, Object>(); */

		bList =	bookService.selectBook();
		System.out.println(bList.toString());
		model.addAttribute("bList",bList);
		/* commandMap.put("bList1", bList); */
		return "book/findBook";
	}
	
}
