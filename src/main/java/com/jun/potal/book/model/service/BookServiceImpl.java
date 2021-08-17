package com.jun.potal.book.model.service;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;
=======
import java.util.List;
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.book.model.repository.BookDao;
<<<<<<< HEAD
import com.jun.potal.common.paging.Paging;
import com.jun.potal.vo.Book;
=======
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
import com.jun.potal.vo.User;

@Service
@Repository
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;


	@Override
<<<<<<< HEAD
	public Map<String, Object> selectBook(int page) throws Exception{	
=======
	public List<Book> selectBook() throws Exception{	
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
		/* List<Book> bookList = bookDao.selectBook(); */
		
		/*
		 * Book book = (Book) bookDao.selectBook(); Map<String,Object> commandMap = new
		 * HashMap<String, Object>(); commandMap.put("bList", book); return commandMap;
		 */
<<<<<<< HEAD
		
		Paging paging = Paging.builder()
				.currentPage(page)
				.blockCnt(5)
				.cntPerPage(10)
				.type("BOOK")
				.total(bookDao.selectContentCnt())
				.sort("TITLE")
				.direction("asc")
				.build();
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("paging", paging);
		commandMap.put("bList",bookDao.selectBook(paging));
		return commandMap;
	}

	@Override
	public Map<String, Object> selectBookSearch(int page, Book book) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스임플 제목 : "+book.getTitle());
		System.out.println("서비스임플 작가 : "+book.getAuthor());
		
		Paging paging = Paging.builder()
				.currentPage(page)
				.blockCnt(5)
				.cntPerPage(10)
				.type("BOOK")
				.total(bookDao.selectContentCnt())
				.sort("TITLE")
				.direction("asc")
				.title(book.getTitle())
				.author(book.getAuthor())
				.build();
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("paging", paging);
		commandMap.put("bList",bookDao.selectBookSearch(paging));
		System.out.println("서비스 임플 : " + commandMap.toString());
		return commandMap;
=======
		return bookDao.selectBook();
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
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

<<<<<<< HEAD
	@Override
	public List<Book> abcSelect(Book book) throws Exception {
		// TODO Auto-generated method stub
		return bookDao.abcSelect(book);
	}



=======
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4




}
