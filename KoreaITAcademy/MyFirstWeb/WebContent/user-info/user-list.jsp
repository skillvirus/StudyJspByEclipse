<%@page import="java.sql.ResultSet"%>
<%@page import="com.koreait.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

ResultSet resultSet = null;

//String rootPath = request.getServletContext().getRealPath("/");
User userInfo = new User();

userInfo.setUserID("");
userInfo.setUserName("");
userInfo.setUserPhoneNum("");

resultSet = userInfo.selectUserInfo(userInfo);


/*
Connection connection = null; //데이터베이스 연결된 상태(세션)를 저장하는 객체
PreparedStatement preparedStatement = null; //SQL문을 나타내는 객체
ResultSet resultSet = null; //SQL 쿼리문의 결과값을 저장하는 객체
String queryString; //SQL 쿼리문

//try {
	
	queryString = "SELECT UserID, UserName, UserPhoneNum FROM UserInfo ORDER BY UserID DESC";
	//String dbPath = "jdbc:sqlite:" + request.getContextPath() + "/Resources/DataBase/BookManagement.db";
	
	Class.forName("org.sqlite.JDBC");
	connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\MainUser\\UserDevelopProjects\\StudyJspByEclipse\\KoreaITAcademy\\MyFirstWeb\\WebContent\\Resources\\Database\\BookManagement.db");
	//connection = DriverManager.getConnection(dbPath);
	preparedStatement = connection.prepareStatement(queryString);
	resultSet = preparedStatement.executeQuery();
	
	/*	while(resultSet.next()) {
		System.out.println(resultSet.getString(1) + " | " + resultSet.getString(2) + " | " + resultSet.getString(3));
 	}
} catch (Exception e) {
	System.out.println(e);
} */


%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
		<!-- <form method="GET"> -->
		    <table class="mainTable" border="1">
				<tr height="100px">
					<td colspan=2>
						<jsp:include page="/sub-page/header.jsp" flush="false"/>
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
								<%while(resultSet.next()) {%>
								<tr>
									<td><%=resultSet.getString("UserID")%></td>
									<td><a class="link" href="user-detail.jsp?id=<%=resultSet.getString("UserID")%>"><%=resultSet.getString("UserName")%></a></td>
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
							<table class="subTable">
								<tr>
									<td><a class="link" href="/user-info/user-insert.jsp">등록</a></td>
									<td>
										<select name="searchOption">
											<option value="id">ID</option>
	      									<option value="name">이름</option>
	     									<option value="phoneNum">전화번호</option>
										</select>
										<input type="text">
										<a class="link" href="#">조회</a>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr height="100px">
					<td colspan=2>
						<jsp:include page="/sub-page/footer.jsp" flush="false"/>
					</td>
				</tr>
		    </table>
	    <!-- </form>  -->
    </body>
</html>
<%
resultSet.close();
userInfo.closeDatabase();
%>


