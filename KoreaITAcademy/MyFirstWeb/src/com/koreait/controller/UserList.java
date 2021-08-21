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

//@WebServlet("/user-info/user-list2")
@WebServlet("/user-info/user-list")
public class UserList extends HttpServlet {
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
		
		List<User> userList = new ArrayList<>();
		
		ResultSet resultSet = null;
		
		User userInfo = new User();

		if (searchOption.equals("id")) {
			userInfo.setUserID(searchContent);
			userInfo.setUserName("%%");
			userInfo.setUserPhoneNum("%%");
		} else if (searchOption.equals("name")) {
			userInfo.setUserID("");
			userInfo.setUserName("%" + searchContent + "%");
			userInfo.setUserPhoneNum("%%");
		} else if (searchOption.equals("phoneNum")) {
			userInfo.setUserID("");
			userInfo.setUserName("%%");
			userInfo.setUserPhoneNum("%" + searchContent + "%");
		} else {
			userInfo.setUserID("");
			userInfo.setUserName("%%");
			userInfo.setUserPhoneNum("%%");	
		}
		
		userInfo.setUserPageNum(pageNum * 10 - 10);

		resultSet = userInfo.selectUserInfo(userInfo);
		
		User userInfoCount = new User(); //조회조건을 만족하는 전체 레코드 수를 조회할 용도의 인스턴스
		int recordCount = userInfoCount.selectUserInfoCount(userInfo); //조회조건을 만족하는 전체 레코드 수
		
		try {
			while (resultSet.next()) {
				
				User userData = new User(
									Integer.parseInt(resultSet.getString("UserRowNum")),
									resultSet.getString("UserID"),
									resultSet.getString("UserName"),
									resultSet.getString("UserPhoneNum")
								);
				
				userList.add(userData);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			userInfo.closeDatabase();
			userInfoCount.closeDatabase();
		}
				
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/user-info/user-list.jsp").forward(request, response); //JSTL사용
		//request.getRequestDispatcher("/user-info/user-list2.jsp").forward(request, response); //EL사용/JSTL미사용
	}
}
