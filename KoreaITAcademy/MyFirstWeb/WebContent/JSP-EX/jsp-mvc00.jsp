<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String scoreTemp = request.getParameter("score");
int score = 0;

if(scoreTemp != null && !scoreTemp.equals("")) {
	score = Integer.parseInt(scoreTemp);
}
%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
	<title>JSP MVC</title>
	</head>
	<body>
		<%if (score >= 90) {%>
			당신은 우등생입니다.
		<%} else if (score >= 40) {%>
			조금만 더 노력하세요.
		<%} else { %>
			많이 노력해야겠네요.
		<%} %>
	</body>
</html>
<!-- 코드블럭이 여기저기 위치해있어서 가독성도 떨어지고, 유지보수 하기 어려운 구조 -->