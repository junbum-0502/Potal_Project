package com.jun.potal.book.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun.potal.common.paging.Paging;
import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
import com.jun.potal.vo.User;

@Repository
public class BookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Book> selectBook(Paging paging) throws Exception{
		System.out.println("북다오1 : " + paging.toString());
		System.out.println("북다오1 : " + sqlSession.selectList("Book.selectBookSearch",paging).toString()); 
		return sqlSession.selectList("Book.selectBook",paging);
	}
	
	public List<Book> selectBookSearch(Paging paging) throws Exception{
		System.out.println("북다오2 : " + paging.toString());
		System.out.println("북다오2 : " + sqlSession.selectList("Book.selectBookSearch",paging).toString()); 
		return sqlSession.selectList("Book.selectBookSearch",paging);
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
	
	public int selectContentCnt() throws Exception{
		return sqlSession.selectOne("Book.selectContentCnt");
	}
	
	public int selectContentCntSearch(Book book) throws Exception{
		return sqlSession.selectOne("Book.selectContentCntSearch",book);
	}
	
	public List<Book> abcSelect(Book book) throws Exception{
		return sqlSession.selectList("Book.abcSelect",book);
	}
	
	public int delRentHis(Rent rent) throws Exception{
		return sqlSession.delete("Book.delRentHis",rent);
	}
	
	public int upRentHis(int bIdx) throws Exception{
		return sqlSession.update("Book.upRentHis",bIdx);
	}
	
	public int upRentReturn(int rIdx) throws Exception{
		return sqlSession.update("Book.upRentReturn",rIdx);
	}
	
}