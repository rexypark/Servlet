<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="updateVO" class="com.bc.mybatis.GuestbookVO"/>
<jsp:setProperty property="*" name="updateVO"/>
<%
	System.out.println("updateVO : " + updateVO);
	SqlSession ss = DBService.getFactory().openSession();

	try {
		ss.insert("editData", updateVO);
		ss.commit();
		response.sendRedirect("list.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		ss.rollback();
		response.sendRedirect("update.jsp");
	} finally {
		ss.close();
	}
	
%>
	
	
	