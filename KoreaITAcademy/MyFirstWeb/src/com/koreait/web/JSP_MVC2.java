package com.koreait.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp-mvc02")
public class JSP_MVC2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String scoreTemp = request.getParameter("score");
		int score = 0;

		if(scoreTemp != null && !scoreTemp.equals("")) {
			score = Integer.parseInt(scoreTemp);
		}

		String result = "";

		if (score >=90) {
			result = "당신은 우등생입니다.";
		} else if (score >= 40) {
			result = "조금만 더 노력하세요.";
		} else {
			result = "많이 노력해야겠네요.";
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP-EX/jsp-mvc02.jsp");
		dispatcher.forward(request, response);
	}
}
