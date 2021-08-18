<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloName.jsp</title>
	</head>
	<body>
		<h1>Hello : <%out.print(name);%></h1>
	</body>
</html>