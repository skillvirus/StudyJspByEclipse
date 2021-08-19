<%@page import="com.koreait.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리(JSTL사용)</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
		<form method="GET">
		    <table class="mainTable" border="1">
				<tr height="100px">
					<td colspan=2>
						<jsp:include page="/sub-page/top.jsp" flush="false"/>
					</td>
				</tr>
				<tr height="600px">
					<td width="20%">
						<jsp:include page="/sub-page/left.jsp" flush="false"/>
					</td>
					<td>
						<div class="main">
							<h1>사용자 정보</h1>
							<table class="subTable" border="1">
								<tr>
									<td><b>ID</b></td>
									<td><b>이름</b></td>
									<td><b>전화번호</b></td>
								</tr>
								<%
								List<User> userList = (List<User>)request.getAttribute("userList");
								for (User u : userList) {
									pageContext.setAttribute("u", u);
								%>
								<tr>
									<td>${u.userID}</td>
									<td><a href="user-detail.jsp?id=${u.userID}">${u.userName}</a></td>
									<td>${u.userPhoneNum}</td>
								</tr>
								<%} %>
							</table>
						</div>
						<div class="main">
							&lt; 1 2 3 4 5 &gt;
						</div>
						<br>
						<div class="main">
							<table class="subTable">
								<tr>
									<td><a href="/user-info/user-insert.jsp">등록</a></td>
									<td>
										<select name="searchOption">
											<option value="id">ID</option>
	      									<option value="name">이름</option>
	     									<option value="phoneNum">전화번호</option>
										</select>
										<input type="text">
										<a href="#">조회</a>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr height="100px">
					<td colspan=2>
						<jsp:include page="/sub-page/bottom.jsp" flush="false"/>
					</td>
				</tr>
		    </table>
	    </form>
    </body>
</html>

