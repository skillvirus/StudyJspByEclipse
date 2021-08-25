<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	pageContext.setAttribute("hello", "Hello World");
	pageContext.setAttribute("name", "Name : page");
%>
<body>
	age(스크립틀릿) = <%= request.getAttribute("age") %><br>
	age(EL) = ${age}<br>
	names[0] = ${names[0]}<br>
	names[1] = ${names[1]}<br>
	user[0] = ${user[0]}<br>
	user[1] = ${user[1]}<br>
	ID = ${userList.userID}<br>
	Name = ${userList.userName}<br>
	${hello}<br>
	${name}<br>
	${requestScope.name}<br>
	${param.p}<br>
	${header.Host}<br>
</body>
</html>