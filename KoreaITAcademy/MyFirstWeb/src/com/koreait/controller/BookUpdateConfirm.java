package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Book;

@WebServlet("/book-info/book-updateConfirm")
public class BookUpdateConfirm extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		String bookID = request.getParameter("bookID"); //도서ID
		String bookTitle = request.getParameter("bookTitle"); //제목
		String bookISBN = request.getParameter("bookISBN"); //ISBN
		
		Book bookInfo = new Book();

		bookInfo.setBookID(bookID);
		bookInfo.setBookTitle(bookTitle);
		bookInfo.setBookISBN(bookISBN);

		bookInfo.updateBookInfo(bookInfo);
		
		response.sendRedirect("/book-info/book-detail?bookid=" + bookID);
	}
}
