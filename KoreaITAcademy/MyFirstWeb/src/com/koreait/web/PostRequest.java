package com.koreait.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/postRequest")
public class PostRequest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String userID = request.getParameter("userID"); //사용자ID
		String userName = request.getParameter("userName"); //사용자성명
		String userPhoneNum = request.getParameter("userPhoneNum"); //전화번호
		String userComment = request.getParameter("userComment"); //비고
		
		out.println(userID);
		out.println("<br>");
		out.println(userName);
		out.println("<br>");
		out.println(userPhoneNum);
		out.println("<br>");
		out.println(userComment);
		out.println("<br>");
	}
}
