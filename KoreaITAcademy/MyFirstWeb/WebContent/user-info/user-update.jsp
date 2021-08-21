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
		<form name="frmUpdate" action="/user-info/user-updateConfirm" onsubmit="return confirmSubmitPopup('정말로 수정하겠습니까?', 'frmUpdate');" method="POST">
		    <table class="mainTable">
				<tr height="100px">
					<td colspan=2>
						<jsp:include page="/sub-page/top.jsp" flush="false"/>
					</td>
				</tr>
				<tr height="600px">
					<td width="20%">
						<jsp:include page="/sub-page/left.jsp" flush="false"/>
					</td>
					<td class="main">
						<div class="main">
							<h2>사용자 정보 수정</h2>
							<table class="subTable1">
								<tr>
									<th>ID</th>
									<td><input type="text" name="userID" value="${u.userID}" readonly></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="userName" value="${u.userName}" type="text"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="userPhoneNum" value="${u.userPhoneNum}" type="text"></td>
								</tr>
							</table>
						</div>
						<div class="main">
							<table class="subTable2">
								<tr align="left">
									<td>
										<a class="button" href="/user-info/user-list">목록</a>&nbsp;
										<input type="submit" id="submitMouseHover" value="갱신"/>
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