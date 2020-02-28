<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - include</title>
</head>
<body>
<%--
	JSP : JSP 페이지의 흐름제어
	사용형태 : <jsp : 액션명령></액션명령>
--%>
	<h1>디렉티브 - include</h1>
	<hr>
	<h2>디렉티브(지시어) - include</h2>
	<%-- include 대상파일의 확장명을 jspf로 사용 --%>
	<%@ include file="ex01_includee1.jspf" %>
	<hr>
	<%@ include file="ex01_includee2_param.jsp" %>
	
	<%-- ============================= --%>
	<hr><hr>
	<h1>액션태그 - jsp:include</h1>
	<jsp:include page="ex01_includee1.jspf"></jsp:include>
	<hr>
	<jsp:include page="ex01_includee.jsp"/>
	
	<hr>
	<h2>액션태그 - jsp:include(파라미터 전달)</h2>
	
	
	
	<%-- param > 파라미터 값 전달 --%>
	<jsp:include page="ex01_includee2_param.jsp">
	
		<jsp:param name="name" value="홍길동"/>
		<jsp:param name="age" value="27"/>
	</jsp:include>
</body>
</html>