<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="500">
		<tr>
			<td>제품번호</td>
			<td>xxxxxx</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>10000원</td>
		</tr>
	</table>
	<jsp:include page="infosub.jsp">
		<jsp:param name="type" value="B"/>
	</jsp:include>
	
</body>
</html>