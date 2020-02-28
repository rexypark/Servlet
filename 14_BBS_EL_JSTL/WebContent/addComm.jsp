<%@page import="com.bs.mybatis.COMMVO"%>
<%@page import="com.bs.mybatis.DAO"%>
<%@page import="com.bs.mybatis.BBSVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cPage = (String)session.getAttribute("cPage");
	BBSVO bvo = (BBSVO)session.getAttribute("bvo");
	String b_idx =  bvo.getB_idx();
	
	
	//c_idx, writer, content, pwd, write_date, ip, b_idx;
	COMMVO commVO = new COMMVO();
%>	

<jsp:useBean id="cvo" class="com.bs.mybatis.COMMVO"/>
<jsp:setProperty property="*" name="cvo"/>

<%
	
	//String writer = request.getParameter("name");
	//String content = request.getParameter("content");
	//String pwd = request.getParameter("pwd");
	
	//commVO.setWriter(request.getParameter("name"));
	//commVO.setContent(request.getParameter("content"));
	//commVO.setPwd(request.getParameter("pwd"));
	cvo.setIp(request.getRemoteAddr());
	cvo.setB_idx(b_idx);
	System.out.print("cvo : " + cvo);
	
	//해당 인덱스를 가진 게시글에 댓글을 추가
	DAO.insertComm(cvo);
	
	response.sendRedirect("view.jsp?cPage?cPage=" + cPage + "&b_idx=" + b_idx);
 %>