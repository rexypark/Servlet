<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션에 설정된 속성 삭제 -->
<%
	//속성을 삭제(att_age)
	session.removeAttribute("attr_name");
	//session.removeAttribute("attr_age");

	//ex01_session.jsp 페이지 재요청 처리(이동, 전환)
	
	response.sendRedirect("ex01_session.jsp");
%>