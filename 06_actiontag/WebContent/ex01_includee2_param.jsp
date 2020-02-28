<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<h1>[여기는 ex01_includee2_param.jsp]</h1>
<h2>이름 : <%=name %></h2>
<h2>나이 : <%=age %></h2>
