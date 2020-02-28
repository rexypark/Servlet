<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부에 선언된 변수(전역변수, 필드변수)</title>
</head>
<body>
	<%!
		//서블릿은 객체가 하나만 생성됨
		//그래서, 선언부에 선언된 필드변수는 값이 하나(공유해서 사용)
		int globalNum = 0;
	
		
		
	%>
	
	<%
		//스크립트릿 - service 메소드 영역(서비스 요청시 호출 실행)
		int localNum = 0;
		globalNum++;
		localNum++;;
		System.out.println("globalNum : " + globalNum);
		System.out.println("localNum : " + localNum);
	%>
	<h2><%=globalNum %></h2>
	<h2><%=localNum %></h2>
</body>
</html>