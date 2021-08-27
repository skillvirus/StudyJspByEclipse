<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
		%>
		
		<h1>
			ID : <%=id %><br>
			PWD : <%=pwd %>
		</h1>
	</body>
</html>