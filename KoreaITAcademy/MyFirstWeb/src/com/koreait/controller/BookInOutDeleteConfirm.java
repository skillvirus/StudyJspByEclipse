package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.User;

@WebServlet("/bookinout-info/bookinout-deleteConfirm")
public class BookInOutDeleteConfirm extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userID = request.getParameter("userid"); //사용자ID
		
		User userInfo = new User();

		userInfo.setUserID(userID);
		
		userInfo.deleteUserInfo(userInfo);
		
		response.sendRedirect("/user-info/user-list");
	}
}
