<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	
	GuestbookVO vo = (GuestbookVO)session.getAttribute("onlistVO");
	System.out.println("vo : " + vo);
	pageContext.setAttribute("voPage", vo);
	SqlSession ss = DBService.getFactory().openSession();

	try {
		ss.delete("deleteData", vo.getIdx());
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