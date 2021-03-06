package com.jun.potal.book.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
	public String index(Model model,@RequestParam(defaultValue="1") int page) throws Exception{
		/*
		 * List<Book> bList = new ArrayList<Book>();
		 * 
		 * bList = bookService.selectBook(page);
		 */
		/* System.out.println(bList.toString()); */
		
		model.addAllAttributes(bookService.selectBook(page));
		System.out.println("모델 전체 :"+model.toString());
		/* commandMap.put("bList1", bList); */
		return "book/findBook";
	}
	
	@PostMapping(value = "bookSearch", produces = "application/text; charset=utf8")
	@ResponseBody
	public String bookSearch(HttpServletRequest request,Model model,@RequestParam(defaultValue="1") int page, Book book) throws Exception{
		/*
		 * List<Book> bList = new ArrayList<Book>();
		 * 
		 * bList = bookService.selectBook(page);
		 */
		/* System.out.println(bList.toString()); */	
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String key = request.getParameter("key");
		
		String titleC = request.getParameter("titleC");
		System.out.println("제목체크 여부"+titleC);
		String authorC = request.getParameter("authorC");
		System.out.println("작가체크 여부"+authorC);
		
		String val = null;
		
			 // 작가검색
			  if(authorC.equals("true") && titleC.equals("false")) {
				  book.setAuthor(key); 
				  book.setTitle(val);
			  // 제목검색 
			  }else if(titleC.equals("true") && authorC.equals("false")){
				  book.setTitle(key); 
				  book.setAuthor(val);
			  }
		
		 
		 
		
		System.out.println("book에 저장된 제목 : "+book.getTitle());
		System.out.println("book에 저장된 작가 : "+book.getAuthor());
		System.out.println("key : " + key);
		
		/*
		List<Book> bList = bookService.abcSelect(book);
		Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput = gson.toJson(bList);
		System.out.println("jsonOutput : "+ jsonOutput); 
		*/
		
		/* 	*/
		/*
		model.addAllAttributes(bookService.selectBookSearch(page,book));	
		System.out.println("모델 검색 :"+model.toString());
		Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput = gson.toJson(model); 	*/
		
		Map<String, Object> bList = new HashMap<String, Object>();
		bList =	bookService.selectBookSearch(page,book);
		model.addAllAttributes(bookService.selectBookSearch(page, book));
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput1 = gson1.toJson(bList);
		System.out.println("jsonOutput1 : " + jsonOutput1);
		
		return jsonOutput1; 
		
		/* return jsonOutput; */
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
		book.setbIdx(bIdx);
		bIdx = bookService.updateBookAmt(bIdx);
		
		String id = request.getParameter("id");
		int userId = Integer.parseInt(id);
		System.out.println("아이디 "+userId);
		book.setBookAmt(userId);
		bookService.insertRentData(book);

		return "redirect:/potal/book";
	}
	@PostMapping("rentHistory")
	public String selectRentHis(HttpServletRequest request,Book book,Model model, User user) throws Exception{
		/* int uid = Integer.parseInt(userId); */
		
		/* int userId=456; */
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		user.setUserId(Integer.valueOf(userId));
		
		List<User> rList = bookService.selectRentHis(user);
		System.out.println("rList : " + rList);
		model.addAttribute("rList",rList);
		
		return "book/rentHistory";
	}
	
	@PostMapping(value = "delRentHis", produces = "application/text; charset=utf8")
	@ResponseBody
	public String delRentHis(HttpServletRequest request,Rent rent,User user) throws Exception{
		
		String rdx = request.getParameter("rIdx");
		String bdx = request.getParameter("bIdx");
		String id = request.getParameter("id");
		
		int rIdx = Integer.parseInt(rdx);
		int bIdx = Integer.parseInt(bdx);
		int uId = Integer.parseInt(id);
		
		System.out.println(rIdx);
		System.out.println(bIdx);
		System.out.println(uId);
		
		user.setUserId(uId);
		rent.setrIdx(rIdx);
		rent.setbIdx(bIdx);
		
		bookService.delRentHis(rent); // 기록삭제
		bookService.upRentHis(bIdx);
		
		List<User> rList = bookService.selectRentHis(user);
		System.out.println("rList : " + rList);
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput = gson1.toJson(rList);
		System.out.println("jsonOutput1 : " + jsonOutput);
		
		return jsonOutput; 
	}
	
	@PostMapping(value = "upRentReturn", produces = "application/text; charset=utf8")
	@ResponseBody
	public String upRentReturn(HttpServletRequest request,User user) throws Exception{
		
		String rdx = request.getParameter("rIdx");
		String id = request.getParameter("id");
		
		int rIdx = Integer.parseInt(rdx);
		int uId = Integer.parseInt(id);
		
		System.out.println(rIdx);
		System.out.println(uId);
		
		user.setUserId(uId);
		
		bookService.upRentReturn(rIdx); // 기간연장
		
		List<User> rList = bookService.selectRentHis(user);
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
		String jsonOutput = gson1.toJson(rList);
		
		return jsonOutput; 
	}
	

	
}