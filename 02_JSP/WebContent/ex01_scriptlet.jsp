<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트릿()</title>
</head>
<body>
	<h1>스크릿트릿(Scriptlet)</h1>
	<h3>자바코드를 작성하는 용도로 사용</h3>
	<% 
	int a = 100;
	int b = 55;
	System.out.println(">> 콘솔창에 출력");
	System.out.println("a + b = " + (a + b));
	
	//JSP에서 제공하는 out객체
	//서블릿 작성시 PrintWriter out = respone.getwriter();
	//형태로 사용했던 out객체라고 생각하면 됨
	out.println("<hr>");
	out.println("<p>JSP에서 제공하는 out객체를 통한 출력</p>");
	out.println("<h2>" + (a+b) + "</h2>");
	
	%>
	
	
	
</body>
</html>