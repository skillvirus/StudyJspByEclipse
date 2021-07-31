package com.koreait.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getRequest")
public class GetRequest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String countTemp = request.getParameter("count");
		int count = 0;
		
		if(countTemp != null && !countTemp.equals("")) {
			count = Integer.parseInt(countTemp);
		}
		
		for (int i = 0; i < count; i++)	{
			out.println((i + 1) + ". 안녕하세요<br>");
		}
	}
}
