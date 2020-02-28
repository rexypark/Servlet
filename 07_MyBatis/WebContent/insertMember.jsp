<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.study.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	//전달 받은 데이터 추출
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper 파일에 있는 insert Member id에 있는 SQL문 사용
	   memberVO 객체를 파라미터 값으로 전달
	3. 페이지 이동 : selectAll 
--%>

	<jsp:useBean id="memberVO" class="com.study.mybatis.MemberVO"/>
	<jsp:setProperty property="*" name="memberVO"/>
<%
	System.out.println("INPUT memberVO : " + memberVO);
	
	//SqlSession 객체 생성
	//.openSession(), .openSession(false) : 오토커밋 아님
	//오토커밋 아님 : 명시적 commit 처리 필요
	SqlSession sqlSession =  DBService.getFactory().openSession();
	
	//id > insertMember에 memberVO 객체를 넘긴다.
	int result = 0;
	try{
		result = sqlSession.insert("insertMember", memberVO);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback(); //작업 취소 처리
	} finally {
		sqlSession.close();		
	}
	
	System.out.println("result : " + result);
	System.out.println("========================");
	System.out.println(">> insert 처리하고 close됨");
	response.sendRedirect("selectAll.jsp");
%>

