<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지(상단,좌측,하단)</title>
</head>
<body>
	<table border width="600">
		<tr>
			<td colspan="2">
				<jsp:include page="module/top.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="module/left.jsp"/>
			</td>
			<td>
				이부분이 본문 내용이 들어갈 위치
				<br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="module/bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>