<%@page import="com.study.mybatis.MemberVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.study.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달 된 id값으로 DB 데이터 삭제 후 전체 조회 페이지 이동--%>
<%-- SqlSession 객체 생성 : 자동 커밋 상태로 생성
	 .delete("deleteMember", id) 처리 후 
	 selectAll.jsp 페이지로 이동
 --%>

<%--
	//전달 받은 데이터 추출
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper 파일에 있는 insert Member id에 있는 SQL문 사용
	   memberVO 객체를 파라미터 값으로 전달
	3. 페이지 이동 : selectAll 
--%>

	<%-- jsp:setProperty 사용 --%>
	<jsp:useBean id="memberVO" class="com.study.mybatis.MemberVO"/>
	<jsp:setProperty property="*" name="memberVO"/>

<%
	System.out.println("I`m memberVO : " + memberVO);
	System.out.println("I`m input id : " + memberVO.getId());
    System.out.println("===============================");
	String id = request.getParameter("id");
	System.out.println("id : " + id);	

	//auto commit
	//SqlSession sqlSession =  DBService.getFactory().openSession(true);
	//no auto commit	
	SqlSession sqlSession =  DBService.getFactory().openSession();
	
	//id > insertMember에 memberVO 객체를 넘긴다.
	// auto commit 방법
	//sqlSession.delete("deleteMember", id);
	//sqlSession.close();	
	
	int result = 0;
	//no auto commit 방법
	try{
		result = sqlSession.delete("deleteMember", id);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback(); //작업 취소 처리
	} finally {
		sqlSession.close();		
	}
	System.out.println("result : " + result);
	System.out.println("========================");
	System.out.println(">> delete 처리하고 close됨");
	response.sendRedirect("selectAll.jsp");
%>

