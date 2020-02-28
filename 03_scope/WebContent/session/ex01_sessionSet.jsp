<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	//session scope의 속성에 저장
	session.setAttribute("attr_name", name);
	session.setAttribute("attr_age", age);
	
	//session scope 저장된 값 조회
	String attr_name = (String)session.getAttribute("attr_name");
	String attr_age = (String)session.getAttribute("attr_age");
	System.out.println(">>session.attr_name : " + attr_name);
	System.out.println(">>session.attr_age : " + attr_age);
	
	
	//==== request scope에 데이터 저장
	request.setAttribute("req_name", name);
	request.setAttribute("req_age", age);
	//==== requestscope에 사용
	String req_name = (String)request.getAttribute("req_name");
	String req_age = (String)request.getAttribute("req_age");
%>  

    <hr>
	<h2>이름(session_attr_name) : <%=attr_name %></h2>
	<h2>이름(session_attr_age) : <%=attr_age %></h2>
	<hr>
	
	<h2>이름(param) : <%=name %></h2>
	<h2>나이(param) : <%=age %></h2>
	<hr>
	<h2>이름(req_name) : <%=req_name %></h2>
	<h2>이름(req_age) : <%=req_age %></h2>
	<hr>
<%
	//response.sendRedirect("ex01_session.jsp");
%>	
	











	
	
	
	
	