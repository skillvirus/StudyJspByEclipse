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

import com.koreait.model.User;

@WebServlet("/user-info/user-list2")
public class UserList2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userInfo = new User();
		
		ResultSet rs = null;
		
		userInfo.setUserID("");
		userInfo.setUserName("%%");
		userInfo.setUserPhoneNum("%%");
		userInfo.setUserRowNum(0);
		
		rs = userInfo.selectUserInfo(userInfo);
		
		List<User> userList = new ArrayList<>();
		
		try {
			while(rs.next()) {
				User userData = new User(
							rs.getString("UserID"),
							rs.getString("UserName"),
							rs.getString("UserPhoneNum")
						);
					
				userList.add(userData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			userInfo.closeDatabase();
		}
		
		request.setAttribute("userList", userList);
		
		request.getRequestDispatcher("/user-info/user-list2.jsp").forward(request, response);
	}
}











