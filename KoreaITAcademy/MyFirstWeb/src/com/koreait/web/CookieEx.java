package com.koreait.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookie-data")
public class CookieEx extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String serverPwd = "1234";
		
		Cookie[] getCookies = request.getCookies();
		
		String cookieIDTemp = "";
				
		if (pwd.equals(serverPwd)) { //로그인성공
			Cookie cookieID = new Cookie("id", id); //문자열만 가능
			
			if (getCookies == null) {
				out.println(id + "님 접속하였습니다.");
				out.print("<br>");
				out.println("안녕하세요.");
				//response.sendRedirect("/main-page.html");
				//response.sendRedirect("/main-page.jsp");
			} else {

				for(Cookie c : getCookies) {
					if (c.getName().equals("id")) {
						cookieIDTemp = c.getValue();
						break; //반복문 중지
					}	
				}
				
				if(id.equals(cookieIDTemp)) {
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
			
			cookieID.setPath("/cookie-data"); //cookie 경로 지정 (context와 불일치하는 경로를 지정하면 cookie 저장 못함)
			cookieID.setMaxAge(60); //만료일자 지정(cookie를 전달한 이후, 단위:초), (12*60*60) -> 하루, 0으로 전달하면 Cookie 삭제
			response.addCookie(cookieID); //클라이언트의 웹브라우저에 전달
			
		} else {
			out.println("비밀번호를 확인하세요.");
		}
	}
}
