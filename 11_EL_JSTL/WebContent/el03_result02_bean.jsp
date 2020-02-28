<%@page import="com.bc.vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터값을 자바빈 Bean VO에 저장해서 사용 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>
<%-- 빈(Bean)객체 PersonVO 타입의 객체 생성하고, vo변수에 저장  --%>
<jsp:useBean id="vo" class="com.bc.vo.PersonVO"/>
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈(Bean)</title>
</head>
<body>
	<h2>결과보기(Bean 사용)</h2>
	<ul>
		<li>이름 : <%=vo.getName() %></li>
		<li>나이 : <%=vo.getAge() %></li>
		<li>성별 : <%=vo.getGender() %></li>
		<li>취미 : <%=vo.getHobby() %></li>
<%
		for(String h : vo.getHobby()) {		
%>		
		<li>취미(반복문) : <%=h %> &nbsp;</li>
<%
		}
%>
	</ul>
	
	<h2>el 사용표현 </h2>
	<ul>
		<li>이름 : ${vo.getName() }></li>
		<li>나이 : ${vo.getAge() }</li>
		<li>성별 : ${vo.getGender() }</li>
		<li>취미 : ${vo.getHobby() }</li>
<%
		for(String h : vo.getHobby()) {		
%>		
		<li>취미(반복문) : ${h } &nbsp;</li>
<%
		}
%>
	</ul>
</body>
</html>