<!-- 페이지 지시자 block -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- _jspServie 메소드에 삽입-->
<%
	String name = request.getParameter("name");
%>
<!-- _jspServie 메소드에 들어가면 안되니 class 멤버로 삽입 -->
<%!
	public int sum(int x, int y) {
		return x + y;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloName.jsp</title>
	</head>
	<body>
		<h1>Hello : <%=name%></h1> <!--처리 결과를 그대로 삽입-->
		<h1>SUM(1, 2) : <%=sum(1, 2)%></h1>
	</body>
</html>