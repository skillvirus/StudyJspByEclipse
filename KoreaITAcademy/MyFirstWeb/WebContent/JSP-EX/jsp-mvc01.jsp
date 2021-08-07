<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- controler region_S -->
<%
String scoreTemp = request.getParameter("score");
int score = 0;

if(scoreTemp != null && !scoreTemp.equals("")) {
	score = Integer.parseInt(scoreTemp);
}

String result= "";

if (score >=90) {
	result = "당신은 우등생입니다.";
} else if (score >= 40) {
	result = "조금만 더 노력하세요.";
} else {
	result = "많이 노력해야겠네요.";
}
%>
<!-- controler region_E -->
<!-- viewer region_S -->
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
	<title>JSP MVC</title>
	</head>
	<body>
		<%=result%>
	</body>
</html>
<!-- viewer region_E -->