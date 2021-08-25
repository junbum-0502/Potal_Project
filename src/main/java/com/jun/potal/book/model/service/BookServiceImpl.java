package com.jun.potal.book.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.book.model.repository.BookDao;
import com.jun.potal.common.paging.Paging;
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
import com.jun.potal.vo.User;

@Service
@Repository
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;


	@Override
	public Map<String, Object> selectBook(int page) throws Exception{	
		/* List<Book> bookList = bookDao.selectBook(); */
		
		/*
		 * Book book = (Book) bookDao.selectBook(); Map<String,Object> commandMap = new
		 * HashMap<String, Object>(); commandMap.put("bList", book); return commandMap;
		 */
		
		Paging paging = Paging.builder()
				.currentPage(page)
				.blockCnt(5)
				.cntPerPage(10)
				.type("BOOK")
				.total(bookDao.selectContentCnt())
				.sort("TITLE")
				.direction("asc")
				.build();
		System.out.println("ajax 전 서비스임플 페이징 : " + paging.toString()); 
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("paging", paging);
		commandMap.put("bList",bookDao.selectBook(paging));
		System.out.println("ajax전 조회 서비스임플 커맨드맵 : " + commandMap.toString());
		return commandMap;
	}

	@Override
	public Map<String, Object> selectBookSearch(int page, Book book) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스임플 제목 : "+book.getTitle());
		System.out.println("서비스임플 작가 : "+book.getAuthor());
		
		Paging newPaging = Paging.builder()
				.currentPage(page)
				.blockCnt(5)
				.cntPerPage(10)
				.type("BOOK")
				.total(bookDao.selectContentCntSearch(book))
				.sort("TITLE")
				.direction("asc")
				.title(book.getTitle())
				.author(book.getAuthor())
				.build();
		System.out.println("ajax 후 서비스임플 페이징 : " + newPaging.toString()); 
		System.out.println(newPaging.getTitle());
		System.out.println(newPaging.getAuthor());
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("newPaging", newPaging);
		commandMap.put("bList",bookDao.selectBookSearch(newPaging));
		System.out.println("ajax 조회 후 서비스임플 커맨드맵 : " + commandMap.toString());
		return commandMap;
	}


	@Override
	public List<Book> selectBookByBidx(String bIdx) throws Exception {
		
		return bookDao.selectBookByBidx(bIdx);
	}


	@Override
	public int updateBookAmt(int bIdx) throws Exception {
		return bookDao.updateBookAmt(bIdx);
	}


	@Override
	public int insertRentData(Book book) throws Exception {
		return bookDao.insertRentData(book);
	}


	@Override
	public List<User> selectRentHis(User user) throws Exception {
		return bookDao.selectRentHis(user);
	}

	@Override
	public List<Book> abcSelect(Book book) throws Exception {
		// TODO Auto-generated method stub
		return bookDao.abcSelect(book);
	}
	
	// delete Rent
	@Override
	public int delRentHis(Rent rent) throws Exception {
		
		return bookDao.delRentHis(rent);
	}

	@Override
	public int upRentHis(int bIdx) throws Exception {
		// TODO Auto-generated method stub
		return bookDao.upRentHis(bIdx); 
	}

	@Override
	public int upRentReturn(int rIdx) throws Exception {
		// TODO Auto-generated method stub
		return bookDao.upRentReturn(rIdx); 
	}







}