package com.koreait.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EL-Ex/el-test")
public class ELTest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String parameter = request.getParameter("p");
		
		//단일값
		request.setAttribute("age", 46); 
		
		//배열
		String[] names = {"Song", "Hong"}; 
		request.setAttribute("names", names);
		
		//ArrayList
		List<String> user = new ArrayList<>();
		user.add("TEST1");
		user.add("TEST2");
		request.setAttribute("user", user);
				
		//HashMap
		HashMap<String, String> userList = new HashMap<>();
		userList.put("userID", "1");
		userList.put("userName", "홍길동");
		request.setAttribute("userList", userList);
		
		//우선순위
		request.setAttribute("name", "Name : request");
		
		request.getRequestDispatcher("/EL-Ex/el-test.jsp").forward(request, response);;
	}
}
