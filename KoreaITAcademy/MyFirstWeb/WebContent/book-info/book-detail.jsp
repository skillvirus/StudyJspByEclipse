<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 정보 관리</title>
		<link rel="stylesheet" href="/css/main.css">
		<script src="/JavaScript/main.js"></script>
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
							<h2>도서 정보 상세</h2>
							<table class="subTable1">
								<tr>
									<th>ID</th>
									<td>${b.bookID}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td>${b.bookTitle}</td>
								</tr>
								<tr>
									<th>ISBN</th>
									<td>${b.bookISBN}</td>
								</tr>
							</table>
						</div>
						<div class="main">
							<table class="subTable2">
								<tr align="left">
									<td>
										<a class="button" href="/book-info/book-list">목록</a>&nbsp;
										<a class="button" href="/book-info/book-update?bookid=${b.bookID}">수정</a>&nbsp;
										<a class="button" href="/book-info/book-deleteConfirm?bookid=${b.bookID}" onclick="return confirmPopup('정말로 삭제하겠습니까?')">삭제</a>
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