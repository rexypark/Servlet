<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String empNo = request.getParameter("idx");
	String name = request.getParameter("name");
	String pay = request.getParameter("pay");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사워등록</title>
</head>
<body>
	<h1>[<%=name %>] 정보 수정</h1>
	<form action="update.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td><input type="text" name="sabun" value=<%=empNo %> readonly="readonly"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value=<%=name %>></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="text" name="pay" value=<%=pay %>></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>