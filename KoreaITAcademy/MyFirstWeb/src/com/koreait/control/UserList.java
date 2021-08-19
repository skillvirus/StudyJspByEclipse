package com.koreait.control;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.User;

@WebServlet("/user-info/user-list")
public class UserList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> userList = new ArrayList<>();
		
		ResultSet resultSet = null;
		
		User userInfo = new User();

		userInfo.setUserID("");
		userInfo.setUserName("");
		userInfo.setUserPhoneNum("");

		resultSet = userInfo.selectUserInfo(userInfo);
		
		try {
			while (resultSet.next()) {
				
				User userData = new User(
									resultSet.getString("UserID"),
									resultSet.getString("UserName"),
									resultSet.getString("UserPhoneNum")
								);
				
				userList.add(userData);
			}
			
			resultSet.close(); 
			userInfo.closeDatabase();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/user-info/user-list.jsp").forward(request, response);
	}
}
