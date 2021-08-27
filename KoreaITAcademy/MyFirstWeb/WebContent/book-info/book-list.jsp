<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 정보 관리</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
		<form action="/book-info/book-list" method="GET">
		    <table class="mainTable">
				<tr>
					<td colspan=2>
						<jsp:include page="/sub-page/top.jsp" flush="false"/>
					</td>
				</tr>
				<tr height="600px">
					<c:set var="page" value="${(empty param.page)?1:param.page}" />
					<c:set var="startNum" value="${page-(page-1)%5}" />
					<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(recordCount/10), '.')}" />
					<td width="20%">
						<jsp:include page="/sub-page/left.jsp" flush="false"/>
					</td>
					<td>
						<div class="main">
							<h2>도서 정보</h2>
							<table class="subTable1">
								<tr>
									<th>No.</th>
									<th>ID</th>
									<th>제목</th>
									<th>ISBN</th>
								</tr>
								<c:forEach var="b" items="${bookList}">
								<tr>
									<td width="50px">${b.bookRowNum}</td>
									<td>${b.bookID}</td>
									<td><a href="book-detail?bookid=${b.bookID}">${b.bookTitle}</a></td>
									<td>${b.bookISBN}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="main">
							<p>${page}/${lastNum} pages</p>
						</div>
						<!-- pager_S -->
						<!-- <p>page:${page} / startNum:${startNum} / lastNum:${lastNum}</p> -->
						<div class="main">
							<!-- &lt; 1 2 3 4 5 &gt; -->
							<c:if test="${page+0 > 1}">
								<a class="pageButton" href="?page=${page-1}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">&lt;</a>
							</c:if>
							<c:if test="${page+0 <= 1}">
								<a class="pageButton" onclick="alert('이전 페이지가 없습니다.');">&lt;</a>
							</c:if>
							<c:forEach var="i" begin="0" end="4">
							<c:if test="${startNum + i - 1 < lastNum}">
								<a style="color:${(page==(startNum+i))?'orange':''};font-weight:${(page==(startNum+i))?'bold':''}" href="?page=${startNum+i}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">${startNum+i}</a>
							</c:if>
							</c:forEach>
							<c:if test="${page+0 < lastNum+0}">
								<a class="pageButton" href="?page=${page+1}&searchOption=${param.searchOption}&searchContent=${param.searchContent}">&gt;</a>
							</c:if>
							<c:if test="${page+0 >= lastNum+0}">
								<a class="pageButton" onclick="alert('다음 페이지가 없습니다.');">&gt;</a>
							</c:if>
						</div>
						<!-- pager_E -->
						<div class="main">
							<table class="subTable2">
								<tr>
									<td><a class="button" href="/book-info/book-insert.jsp">등록</a></td>
									<td align="right" width="100%">
										<select name="searchOption" style="width:80px;height:26px;">
											<option ${(param.searchOption == "id") ? "selected" : ""} value="id">ID</option>
	      									<option ${(param.searchOption == "title") ? "selected" : ""} value="name">제목</option>
	     									<option ${(param.searchOption == "isbn") ? "selected" : ""} value="phoneNum">ISBN</option>
										</select>
									</td>
									<td align="right">
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
