package com.koreait.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session-data")
public class SessionEx extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String serverPwd = "1234";
		
		HttpSession session = request.getSession();
		
		if (pwd.equals(serverPwd)) {
			if (session.getAttribute("id") == null) {
				out.println(id + "님 접속하였습니다.");
				out.print("<br>");
				out.println("안녕하세요.");
				//response.sendRedirect("/main-page.html");
				//response.sendRedirect("/main-page.jsp");
			} else {
				if(id.equals(session.getAttribute("id"))) {
					out.println(id + "님은 현재 접속한 사용자입니다.");
					out.print("<br>");
					out.println("로그인할 수 없습니다.");
					//response.sendRedirect("/error-page.html");
					//response.sendRedirect("/error-page.jsp");
				} else {
					out.println(id + "님 접속하였습니다.");
					out.print("<br>");
					out.println("안녕하세요.");
					//response.sendRedirect("/main-page.html");
					//response.sendRedirect("/main-page.jsp");
				}
			}
			session.setAttribute("id", id);
		} else {
			out.println("비밀번호를 확인하세요.");
		}
	}
}
