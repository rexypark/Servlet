<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex11_resp_forward_2.jsp</title>

</head>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<body>
	<h2> ["ex11_resp_forward_2.jsp"] </h2>
    <h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
</body>
</html>