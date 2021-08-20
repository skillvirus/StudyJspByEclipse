<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리(JSTL사용)</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
		<form action="/user-info/user-list" method="GET">
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
									<th>No.</th>
									<th>ID</th>
									<th>이름</th>
									<th>전화번호</th>
								</tr>
								<c:forEach var="u" items="${userList}">
								<tr>
									<td width="50px">${u.userRowNum}</td>
									<td>${u.userID}</td>
									<td><a href="user-detail?userid=${u.userID}">${u.userName}</a></td>
									<td>${u.userPhoneNum}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<br>
						<!-- pager_S -->
						<c:set var="page" value="${(empty param.page)?1:param.page}" />
						<c:set var="startNum" value="${page-(page-1)%5}" />
						<c:set var="lastNum" value="" />
						<div class="main">
							<!-- &lt; 1 2 3 4 5 &gt; -->
							<c:if test="${startNum > 1}">
								<a class="pageButton" href="?page=${startNum-1}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">&lt;</a>
							</c:if>
							<c:if test="${startNum <= 1}">
								<a class="pageButton" href="" onclick="alert('첫 페이지입니다.');">&lt;</a>
							</c:if>
														
							<c:forEach var="i" begin="0" end="4">
								<a style="color:${(page==(startNum+i))?'red':''};font-weight:${(page==(startNum+i))?'bold':''}" href="?page=${startNum+i}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">${startNum+i}</a>&nbsp;
							</c:forEach>
							
							<c:if test="${startNum+5 < lastNum}">
								<a class="pageButton" href="?page=${startNum+5}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">&gt;</a>
							</c:if>
							<c:if test="${startNum+5 >= lastNum}">
								<a class="pageButton" href="" onclick="alert('마지막 페이지입니다.');">&gt;</a>
							</c:if>
						</div>
						<!-- pager_E -->
						<div class="main">
							<table class="subTable2">
								<tr>
									<td><a class="button" href="/user-info/user-insert.jsp">등록</a></td>
									<td align="right">
										<select name="searchOption" style="width:80px;height:26px;">
											<option ${(param.searchOption == "id") ? "selected" : ""} value="id">ID</option>
	      									<option ${(param.searchOption == "name") ? "selected" : ""} value="name">이름</option>
	     									<option ${(param.searchOption == "phoneNum") ? "selected" : ""} value="phoneNum">전화번호</option>
										</select>
										<input type="text" name="searchContent" value="${param.searchContent}">
									</td>
									<td align="left">
										<input type="submit" id="submitMouseHover" value="검색"/>
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
