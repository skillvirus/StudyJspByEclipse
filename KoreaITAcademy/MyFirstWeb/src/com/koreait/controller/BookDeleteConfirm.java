package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Book;

@WebServlet("/book-info/book-deleteConfirm")
public class BookDeleteConfirm extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookID = request.getParameter("bookid"); //도서ID
		
		Book bookInfo = new Book();

		bookInfo.setBookID(bookID);
		
		bookInfo.deleteBookInfo(bookInfo);
		
		response.sendRedirect("/book-info/book-list");
	}
}
