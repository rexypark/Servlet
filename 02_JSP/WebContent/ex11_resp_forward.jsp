<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩방식</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<h2>[ ex11_resp_forward.jsp 페이지 ]</h2>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
<%
	//포워딩(위임처리)
	//RequestDispatcher rd = request.getRequestDispatcher("ex11_resp_forward_2.jsp");
	//rd.forward(request, response);
	
	request.getRequestDispatcher("ex11_resp_forward_2.jsp");
	
%>
	
	 
</body>
</html>