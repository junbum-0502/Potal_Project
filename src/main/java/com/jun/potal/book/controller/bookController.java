package com.jun.potal.book.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.potal.book.model.service.BookService;
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
import com.jun.potal.vo.User;

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
		/* System.out.println(bList.toString()); */
		model.addAttribute("bList",bList);
		/* commandMap.put("bList1", bList); */
		return "book/findBook";
	}
	
	
	@GetMapping("bookInfo")
	public String bookInfo(String bIdx,Model model) throws Exception{
		
		List<Book> bList = new ArrayList<Book>();
		bList = bookService.selectBookByBidx(bIdx);
		model.addAttribute("bList",bList);

		return "book/bookInfo";
	}
	
	@GetMapping("rent")
	public String updateRentAndBidx(HttpServletRequest request,Book book,User user) throws Exception{
		
		/* HttpSession session = request.getSession(); */
		
		int bIdx = book.getbIdx();
		bIdx = bookService.updateBookAmt(bIdx);
		
		
		String id = request.getParameter("id");
		int userId = Integer.parseInt(id);
		System.out.println("아이디 "+userId);
		book.setBookAmt(userId);
		bookService.insertRentData(book);

		return "redirect:/potal/book";
	}
	@GetMapping("rentHistory")
	public String selectRentHis(HttpServletRequest request,Book book,Model model) throws Exception{
		/* int uid = Integer.parseInt(userId); */
		
		/* int userId=456; */
		/* book.setbIdx(userId); */
		
		String a = request.getParameter("rUid");
		int userId = Integer.parseInt(a);

		System.out.println(userId);
		book.setbIdx(userId);
		
		 List<Rent> rList = new ArrayList<Rent>();
		 rList =bookService.selectRentHis(book.getbIdx()); 
		 model.addAttribute("rList",rList);
		 
		
		return "book/rentHistory";
	}
	

	
}
