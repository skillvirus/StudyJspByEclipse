package com.koreait.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Book;

@WebServlet("/book-info/book-list")
public class BookList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNum_ = request.getParameter("page");
		String searchOption_ = request.getParameter("searchOption");
		String searchContent_ = request.getParameter("searchContent");
		
		Integer pageNum = 1;
		String searchOption = "";
		String searchContent = "";
		
		if(pageNum_ != null && !pageNum_.equals("")) {
			pageNum = Integer.parseInt(pageNum_);
		}
		
		if(searchOption_ != null && !searchOption_.equals("")) {
			searchOption = searchOption_;
		}
		
		if(searchContent_ != null && !searchContent_.equals("")) {
			searchContent = searchContent_;
		}
		
		List<Book> bookList = new ArrayList<>();
		
		ResultSet resultSet = null;
		
		Book bookInfo = new Book();

		if (searchOption.equals("id")) {
			bookInfo.setBookID(searchContent);
			bookInfo.setBookTitle("%%");
			bookInfo.setBookISBN("%%");
		} else if (searchOption.equals("title")) {
			bookInfo.setBookID("");
			bookInfo.setBookTitle("%" + searchContent + "%");
			bookInfo.setBookISBN("%%");
		} else if (searchOption.equals("isbn")) {
			bookInfo.setBookID("");
			bookInfo.setBookTitle("%%");
			bookInfo.setBookISBN("%" + searchContent + "%");
		} else {
			bookInfo.setBookID("");
			bookInfo.setBookTitle("%%");
			bookInfo.setBookISBN("%%");	
		}
		
		bookInfo.setBookPageNum(pageNum * 10 - 10);

		resultSet = bookInfo.selectBookInfo(bookInfo);
		
		Book bookInfoCount = new Book(); //조회조건을 만족하는 전체 레코드 수를 조회할 용도의 인스턴스
		int recordCount = bookInfoCount.selectBookInfoCount(bookInfo); //조회조건을 만족하는 전체 레코드 수
		
		try {
			while (resultSet.next()) {
				
				Book bookData = new Book(
									Integer.parseInt(resultSet.getString("BookRowNum")),
									resultSet.getString("BookID"),
									resultSet.getString("BookTitle"),
									resultSet.getString("BookISBN")
								);
				
				bookList.add(bookData);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			bookInfo.closeDatabase();
			bookInfoCount.closeDatabase();
		}
				
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("/book-info/book-list.jsp").forward(request, response);
	}
}
