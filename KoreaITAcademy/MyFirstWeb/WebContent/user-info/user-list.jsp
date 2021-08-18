<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 관리</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
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
							<%for (int i = 0; i < 5; i++) {%>
							<tr>
								<td>1</td>
								<td>홍길동</td>
								<td>010-0000-0000</td>
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
    </body>
</html>