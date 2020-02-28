<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//서블릿에서 사용했던 방법 그대로 사용
	//전달받은 파라미터 값 추출
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	System.out.println("id : " + id);
	System.out.println("pw : " + pw);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(응답)전달 받은 값 출력</title>
</head>
<body>
	<h1>(응답)당신이 입력한값 맞나요?</h1>
	<h2>ID : <%=id %></h2>
	<h2>PW : <%=pw %></h2>
	
</body>
</html>