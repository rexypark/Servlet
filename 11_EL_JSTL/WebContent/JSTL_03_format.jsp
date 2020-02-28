<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h1>데이터 포멧 지정</h1>
	<h2>숫자 포맷 지정 태그 - formatNumber</h2>
	<%--
	minIntegerDigits = 정수부 최소 표시 자리수 지정(없으면 0표시)
	minFractionDigits = 소수점(소수점이하) 최소자리 지정(없으면 0표시)
	maxIntegerDigits = 정수부 최대표시 자리수 지정(많으면 버려짐)
	maxFractionDigits = 소수점 이하 표시 자리수 지정(넘치면 버려짐 6부터 올림처리)
	
	
	 --%>
	<fmt:formatNumber value="123" type="number"/>
	<br>
	<fmt:formatNumber value="123" type="number" minIntegerDigits="10"/>
	<br>
	<fmt:formatNumber value="123" type="number" minFractionDigits="2"/>
	<br>
	<fmt:formatNumber value="123" type="number" maxIntegerDigits="1"/>
	<br>
	123.456 : <fmt:formatNumber value="123.456" type="number" maxFractionDigits="2"/><br>
	123.455 : <fmt:formatNumber value="123.455" type="number" maxFractionDigits="2"/><br>
	123.454 : <fmt:formatNumber value="123.454" type="number" maxFractionDigits="2"/><br>
	
	<hr>
	
	<h2>form</h2>
	<h2>formatNumber : pattern 적용</h2>
	<fmt:formatNumber value="123456.78" pattern=".000"/><br>
	<fmt:formatNumber value="123456.78" pattern=".###"/><br>
	<fmt:formatNumber value="123456.6786" pattern=".000"/><br>
	<fmt:formatNumber value="123456.6785" pattern=".###"/><br>
	

	<h2>정수부 패턴 속성 적용(#,###.## / 0,000.00)</h2>	
	<fmt:formatNumber value="91123456.678" pattern="#,###.##"/><br>
	<fmt:formatNumber value="91123456.678" pattern="0,000.00"/><br>

	<fmt:formatNumber value="1.678" pattern="#,###.##"/><br>
	<fmt:formatNumber value="1.678" pattern="0,000.00"/><br>
	
	<fmt:formatNumber value="1" pattern="#,###.##"/><br>
	<fmt:formatNumber value="1" pattern="0,000.00"/><br>	
	<fmt:formatNumber value="1" pattern="0,000.0#"/><br>
	<fmt:formatNumber value="0" pattern="#,###.##"/><br>	
	<h2>formatDate : 날짜 출력</h2>
	<%
		Date now = new Date();%>
		표현식 : <%=now %>
		<% pageContext.setAttribute("now", now); %>
		<p>날짜 : ${now }</p> 
		
		<h3>formatDate 사용(날짜표시)</h3>
		<fmt:formatDate value="${now }"/>
		dateStyle="short" : <fmt:formatDate value="${now }" dateStyle="short"/><br>
		dateStyle="medium" : <fmt:formatDate value="${now }" dateStyle="medium"/><br>
		dateStyle="long" : <fmt:formatDate value="${now }" dateStyle="long"/><br>
		dateStyle="full" : <fmt:formatDate value="${now }" dateStyle="full"/><br>
		
		<h3>formatDate 사용(시간표시)</h3>
		
		dateStyle="short" : <fmt:formatDate type="time" value="${now }" dateStyle="short"/><br>
		dateStyle="medium" : <fmt:formatDate type="time" value="${now }" dateStyle="medium"/><br>
		dateStyle="long" : <fmt:formatDate type="time" value="${now }" dateStyle="long"/><br>
		dateStyle="full" : <fmt:formatDate type="time" value="${now }" dateStyle="full"/><br>
		
		<h3>formatDate 사용(날짜, 시간표시)</h3>
		
		dateStyle="short" : <fmt:formatDate type="both" value="${now }" dateStyle="short"/><br>
		dateStyle="medium" : <fmt:formatDate type="both" value="${now }" dateStyle="medium"/><br>
		dateStyle="long" : <fmt:formatDate type="both" value="${now }" dateStyle="long"/><br>
		dateStyle="full" : <fmt:formatDate type="both" value="${now }" dateStyle="full"/><br>
		
		<h3>formatDate 사용(날짜, 시간표시 - pattern)</h3>
		
		dateStyle="short" : <fmt:formatDate type="both" value="${now }" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br>

		
</body>
</html>