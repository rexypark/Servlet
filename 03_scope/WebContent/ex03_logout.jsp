<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 세션초기화
	session.invalidate();

	response.sendRedirect("ex03_login.jsp");
%>