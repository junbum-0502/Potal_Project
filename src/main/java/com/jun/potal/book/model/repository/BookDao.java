package com.jun.potal.book.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.vo.Book;

@Repository
public class BookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Book> selectBook() throws Exception{
		
		
		return sqlSession.selectList("Book.selectBook");
	}
	
}


