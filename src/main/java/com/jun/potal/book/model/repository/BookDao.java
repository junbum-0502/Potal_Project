package com.jun.potal.book.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
import com.jun.potal.vo.User;

@Repository
public class BookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Book> selectBook() throws Exception{
		
		return sqlSession.selectList("Book.selectBook");
	}
	
	public List<Book> selectBookByBidx(String bIdx) throws Exception{
		return sqlSession.selectList("Book.selectBookByBidx",bIdx);
	}
	
	public int insertRentData(Book book) throws Exception{
		return sqlSession.insert("Book.insertRentData",book);
	}
	
	public int updateBookAmt(int bIdx) throws Exception{
		return sqlSession.update("Book.updateBookAmt",bIdx);
	}
	
	public List<User> selectRentHis(User user) throws Exception{
		return sqlSession.selectList("Book.selectRentHis",user);
	}
	
}


