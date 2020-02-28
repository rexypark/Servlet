<%@page import="com.bs.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	System.out.println("c_idx : " + c_idx);
	DAO.deleteComm(c_idx);
	
	/* 페이지 이동처리(view.jsp - b_idx, cPage 값 전달)
	b_idx : 파라미터 값으로 전달받은 값 사용
	cPage : session 에 있는 "cPage" 속성 값 사용
	*/
	
	String cPage = (String)session.getAttribute("cPage");
	response.sendRedirect("view.jsp?b_idx=" + b_idx + "&cPage=" + cPage);
	
%>