<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 정보 등록</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
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
				<td class="main">
					<h1>사용자 정보 등록</h1>
				</td>
			</tr>
			<tr height="100px">
				<td colspan=2>
					<jsp:include page="/sub-page/bottom.jsp" flush="false"/>
				</td>
			</tr>
	    </table>
	</body>
</html>