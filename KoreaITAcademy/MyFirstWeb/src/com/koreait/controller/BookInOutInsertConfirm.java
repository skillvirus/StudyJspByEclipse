package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.User;

@WebServlet("/bookinout-info/bookintou-insertConfirm")
public class BookInOutInsertConfirm extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		String userID = request.getParameter("userID"); //사용자ID
		String userName = request.getParameter("userName"); //사용자성명
		String userPhoneNum = request.getParameter("userPhoneNum"); //전화번호
		
		User userInfo = new User();

		userInfo.setUserID(userID);
		userInfo.setUserName(userName);
		userInfo.setUserPhoneNum(userPhoneNum);

		userInfo.insertUserInfo(userInfo);
		
		response.sendRedirect("/user-info/user-list");
	}
}
