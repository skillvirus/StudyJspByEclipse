package com.koreait.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//다국어 문자열 다룰 때는 PrintStream 클래스보다 PrintWriter 클래스를 사용
		PrintWriter out = response.getWriter();  
		out.println("Hello Servlet");
	}
}
