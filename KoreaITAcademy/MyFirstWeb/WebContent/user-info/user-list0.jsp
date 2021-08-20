<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection connection = null; //데이터베이스 연결된 상태(세션)를 저장하는 객체
	PreparedStatement preparedStatement = null; //SQL문을 나타내는 객체
	ResultSet resultSet = null; //SQL 쿼리문의 결과값을 저장하는 객체
	String queryString; //SQL 쿼리문
	queryString = "SELECT UserID, UserName, UserPhoneNum FROM UserInfo";
	
	Class.forName("org.sqlite.JDBC");
	connection = DriverManager.getConnection("jdbc:sqlite:c:/Users/MainUser/UserDevelopProjects/StudyJspByEclipse/KoreaITAcademy/MyFirstWeb/WebContent/Resources/Database/BookManagement.db");
	preparedStatement = connection.prepareStatement(queryString);
	resultSet = preparedStatement.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리(Spaghetti Source)</title>
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
								while(resultSet.next()) {
								%>
								<tr>
									<td><%=resultSet.getString("UserID")%></td>
									<td><a href="user-detail.jsp?id=<%=resultSet.getString("UserID")%>"><%=resultSet.getString("UserName")%></a></td>
									<td><%=resultSet.getString("UserPhoneNum")%></td>
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
<%
	resultSet.close();
	connection.close();
%>
