<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Controller -->
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
	
	List<User> userList = new ArrayList<>();
	
	while(resultSet.next()) {
		User userData = new User(
				resultSet.getString("UserID"),
				resultSet.getString("UserName"),
				resultSet.getString("UserPhoneNum")
			);

		userList.add(userData);
	}
	
	resultSet.close();
	connection.close();
%>
<!-- Model -->
<%!
	public class User {
		private String userID;//ID
		private String userName; //이름
		private String userPhoneNum; //전화번호
		
		public User(String userID, String userName, String userPhoneNum) {
			this.userID = userID;
			this.userName = userName;
			this.userPhoneNum = userPhoneNum;
		}
		
		public String getUserID() {
			return userID;
		}
		
		public void setUserID(String userID) {
			this.userID = userID;
		}
		
		public String getUserName() {
			return userName;
		}
		
		public void setUserName(String userName) {
			this.userName = userName;
		}
		
		public String getUserPhoneNum() {
			return userPhoneNum;
		}
		
		public void setUserPhoneNum(String userPhoneNum) {
			this.userPhoneNum = userPhoneNum;
		}
	}
%>
<!-- View -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리(MVC1)</title>
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
								for (int i = 0; i < userList.size(); i++) {
								%>
								<tr>
									<td><%=userList.get(i).getUserID()%></td>
									<td><a href="user-detail.jsp?id=<%=userList.get(i).getUserID()%>"><%=userList.get(i).getUserName()%></a></td>
									<td><%=userList.get(i).getUserPhoneNum()%></td>
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
