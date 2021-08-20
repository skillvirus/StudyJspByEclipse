<%@page import="com.koreait.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리(EL사용/JSTL미사용)</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
		<form method="GET">
		    <table class="mainTable">
				<tr>
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
							<h2>사용자 정보</h2>
							<table class="subTable1">
								<tr>
									<th><b>ID</b></th>
									<th><b>이름</b></th>
									<th><b>전화번호</b></th>
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
							<table class="subTable2">
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
				<tr>
					<td colspan=2>
						<jsp:include page="/sub-page/bottom.jsp" flush="false"/>
					</td>
				</tr>
		    </table>
	    </form>
    </body>
</html>

