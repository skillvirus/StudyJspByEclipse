<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Left</title>
	</head>
	<body>
		<div class="left-body">
			<ul>
				<li><a href="/index.jsp">HOME</a></li>
			</ul>
			<ul>
				<!-- <li><a href="/user-info/user-list0.jsp">사용자 정보 관리</a></li><!-- Spaghetti Source -->
				<!-- <li><a href="/user-info/user-list1.jsp">사용자 정보 관리</a></li><!-- MVC1 -->
				<!-- <li><a href="/user-info/user-list2">사용자 정보 관리</a></li><!-- MVC2(JSTL미사용) -->
				<li><a href="/user-info/user-list">사용자 정보 관리</a></li><!-- MVC2(JSTL사용) -->
			</ul>
			<ul>
				<li><a href="/book-info/book-list">도서 정보 관리</a></li>
			</ul>
			<ul>
				<li><a href="#">도서 대여정보 관리</a></li>
			</ul>
		</div>
	</body>
</html>