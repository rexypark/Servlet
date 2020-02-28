<%@page import="java.io.IOException"%>
<%@page import="com.study.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.study.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전체 데이터 정보 보여주기 --%>
<%

	SqlSession sqlSession = DBService.getFactory().openSession();
	String id = request.getParameter("id");
	MemberVO vo = sqlSession.selectOne("selectOne", id);

	System.out.println("memberList : " + vo);
	
	sqlSession.close();
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 데이터 검색</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%-- 테이블형태로 만든 메뉴 및 입력폼 삽입 --%>
	<%@ include file="includee/menu.jspf" %>
	
<% if (vo != null) { %>
		<ul>
			<li>
				idx : <%=vo.getIdx() %>
				id : <%=vo.getId() %>
				pwd : <%=vo.getPwd() %>
				name : <%=vo.getName() %>
				age : <%=vo.getAge() %>
				address : <%=vo.getAddress() %>
				reg : <%=vo.getReg() %>
			</li>
		</ul>
<%
 } else {
	 out.println("<h2>데이터 없음</h2>");
			 
 }

%>
</body>
</html>
