<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리</title>
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
							<h2>사용자 정보 상세</h2>
							<table class="subTable1">
								<tr>
									<th>ID</th>
									<td>${u.userID}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${u.userName}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${u.userPhoneNum}</td>
								</tr>
							</table>
						</div>
						<div class="main">
							<table class="subTable2">
								<tr align="left">
									<td>
										<a class="button" href="/user-info/user-list">목록</a>&nbsp;
										<a class="button" href="/user-info/user-update?userid=${u.userID}">수정</a>&nbsp;
										<a class="button" href="/user-info/user-deleteConfirm?userid=${u.userID}" onclick="return confirmPopup('정말로 삭제하겠습니까?')">삭제</a>
										<!--  <a class="button" href="/user-info/user-deleteConfirm?userid=${u.userID}" onclick="if(!confirm('정말로 삭제하겠습니까?')){return false;}">삭제</a> --> <!-- js파일 미추가-->
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