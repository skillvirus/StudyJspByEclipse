<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서대여관리</title>
		<link rel="stylesheet" href="/css/main.css">
	</head>
	<body>
	    <table width="100%" border="1" cellpadding="1" cellspacing="1">
			<tr height="100px">
				<td colspan=2>
					<jsp:include page="/subpage/header.jsp" flush="false"/>
				</td>
			</tr>
			<tr height="600px">
				<td width="20%">
					<jsp:include page="/subpage/left.jsp" flush="false"/>
				</td>
				<td class="main">
					안녕하세요.
				</td>
			</tr>
			<tr height="100px">
				<td colspan=2>
					<jsp:include page="/subpage/footer.jsp" flush="false"/>
				</td>
			</tr>
	    </table>
    </body>
</html>