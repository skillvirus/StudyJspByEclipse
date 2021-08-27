package com.koreait.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.User;

@WebServlet("/bookinout-info/bookinout-detail")
public class BookInOutDetail extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("userid");
		
		ResultSet resultSet = null;
		
		User userInfo = new User();

		userInfo.setUserID(userID);
		userInfo.setUserName("%%");
		userInfo.setUserPhoneNum("%%");
		userInfo.setUserPageNum(0);

		resultSet = userInfo.selectUserInfo(userInfo);
		User userDetail = null;
		
		try {
				userDetail = new User(
									resultSet.getString("UserID"),
									resultSet.getString("UserName"),
									resultSet.getString("UserPhoneNum")
								);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			userInfo.closeDatabase();
		}
		
		request.setAttribute("u", userDetail);
		request.getRequestDispatcher("/user-info/user-detail.jsp").forward(request, response);
	}
}
