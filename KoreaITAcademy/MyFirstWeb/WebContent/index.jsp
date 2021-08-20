<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 대여 관리</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
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
				<td class="main">
					<h1>도서 대여 관리 시스템</h1>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<jsp:include page="/sub-page/bottom.jsp" flush="false"/>
				</td>
			</tr>
	    </table>
    </body>
</html>