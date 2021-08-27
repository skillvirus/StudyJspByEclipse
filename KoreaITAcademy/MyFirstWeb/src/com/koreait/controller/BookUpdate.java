package com.koreait.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Book;

@WebServlet("/book-info/book-update")
public class BookUpdate extends HttpServlet  {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookID = request.getParameter("bookid");
		
		ResultSet resultSet = null;
		
		Book bookInfo = new Book();

		bookInfo.setBookID(bookID);
		bookInfo.setBookTitle("%%");
		bookInfo.setBookISBN("%%");
		bookInfo.setBookPageNum(0);

		resultSet = bookInfo.selectBookInfo(bookInfo);
		Book bookDetail = null;
		
		try {
				bookDetail = new Book(
									resultSet.getString("BookID"),
									resultSet.getString("BookTitle"),
									resultSet.getString("BookISBN")
								);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			bookInfo.closeDatabase();
		}
		
		request.setAttribute("b", bookDetail);
		request.getRequestDispatcher("/book-info/book-update.jsp").forward(request, response);
	}
}
